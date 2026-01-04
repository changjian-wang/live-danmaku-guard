# Multi-stage build for LiveDanmakuGuard
# Stage 1: Build Backend
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS backend-build
WORKDIR /src

# Copy solution and project files
COPY src/backend/*.sln ./
COPY src/backend/LiveDanmakuGuard.Api/*.csproj ./LiveDanmakuGuard.Api/
COPY src/backend/LiveDanmakuGuard.Core/*.csproj ./LiveDanmakuGuard.Core/
COPY src/backend/LiveDanmakuGuard.Auth/*.csproj ./LiveDanmakuGuard.Auth/
COPY src/backend/LiveDanmakuGuard.Platforms/*.csproj ./LiveDanmakuGuard.Platforms/
COPY src/backend/LiveDanmakuGuard.Data/*.csproj ./LiveDanmakuGuard.Data/

# Restore dependencies
RUN dotnet restore LiveDanmakuGuard.Api/LiveDanmakuGuard.Api.csproj

# Copy all source files
COPY src/backend/ ./

# Build and publish
RUN dotnet publish LiveDanmakuGuard.Api/LiveDanmakuGuard.Api.csproj \
    -c Release \
    -o /app/publish \
    --no-restore

# Stage 2: Build Frontend
FROM node:20-alpine AS frontend-build
WORKDIR /app

# Copy package files
COPY src/frontend/live-danmaku-guard-web/package*.json ./

# Install dependencies
RUN npm ci

# Copy source files
COPY src/frontend/live-danmaku-guard-web/ ./

# Build for production
RUN npm run build

# Stage 3: Backend Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS api
WORKDIR /app
EXPOSE 8080

# Create data directory
RUN mkdir -p /app/data

# Copy published backend
COPY --from=backend-build /app/publish .

# Set environment
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

ENTRYPOINT ["dotnet", "LiveDanmakuGuard.Api.dll"]

# Stage 4: Frontend Runtime (nginx)
FROM nginx:alpine AS web
WORKDIR /usr/share/nginx/html

# Remove default nginx content
RUN rm -rf ./*

# Copy built frontend
COPY --from=frontend-build /app/dist .

# Copy nginx configuration
COPY --from=frontend-build /app/nginx.conf /etc/nginx/conf.d/default.conf || true

# Add basic nginx config if custom one doesn't exist
RUN if [ ! -f /etc/nginx/conf.d/default.conf ]; then \
    echo 'server { \
        listen 80; \
        server_name _; \
        root /usr/share/nginx/html; \
        index index.html; \
        location / { \
            try_files $uri $uri/ /index.html; \
        } \
        location /api { \
            proxy_pass http://api:8080; \
            proxy_http_version 1.1; \
            proxy_set_header Upgrade $http_upgrade; \
            proxy_set_header Connection "upgrade"; \
            proxy_set_header Host $host; \
            proxy_cache_bypass $http_upgrade; \
        } \
    }' > /etc/nginx/conf.d/default.conf; \
fi

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
