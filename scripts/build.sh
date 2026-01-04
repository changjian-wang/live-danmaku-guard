#!/bin/bash
# LiveDanmakuGuard Build Script for Linux/macOS

set -e

echo "======================================"
echo "LiveDanmakuGuard Build Script"
echo "======================================"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

if ! command -v dotnet &> /dev/null; then
    echo -e "${RED}Error: .NET SDK not found${NC}"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo -e "${RED}Error: Node.js not found${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Prerequisites check passed${NC}"

# Build backend
echo ""
echo -e "${YELLOW}Building backend...${NC}"
cd src/backend

echo "Restoring NuGet packages..."
dotnet restore

echo "Building solution..."
dotnet build --configuration Release --no-restore

echo "Running tests..."
dotnet test --configuration Release --no-build --verbosity minimal

echo -e "${GREEN}✓ Backend build successful${NC}"

# Build frontend
echo ""
echo -e "${YELLOW}Building frontend...${NC}"
cd ../frontend/live-danmaku-guard-web

echo "Installing dependencies..."
npm ci

echo "Building application..."
npm run build

echo -e "${GREEN}✓ Frontend build successful${NC}"

# Summary
echo ""
echo "======================================"
echo -e "${GREEN}Build completed successfully!${NC}"
echo "======================================"
echo "Backend output: src/backend/LiveDanmakuGuard.Api/bin/Release/net8.0/"
echo "Frontend output: src/frontend/live-danmaku-guard-web/dist/"
echo ""
echo "To run the application:"
echo "  Backend:  cd src/backend && dotnet run --project LiveDanmakuGuard.Api --configuration Release"
echo "  Frontend: cd src/frontend/live-danmaku-guard-web && npm run preview"
