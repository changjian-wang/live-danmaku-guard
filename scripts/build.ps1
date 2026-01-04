# LiveDanmakuGuard Build Script for Windows PowerShell

$ErrorActionPreference = "Stop"

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "LiveDanmakuGuard Build Script" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Check prerequisites
Write-Host "Checking prerequisites..." -ForegroundColor Yellow

try {
    $dotnetVersion = dotnet --version
    Write-Host "✓ .NET SDK found: $dotnetVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Error: .NET SDK not found" -ForegroundColor Red
    exit 1
}

try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Error: Node.js not found" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Build backend
Write-Host "Building backend..." -ForegroundColor Yellow
Push-Location src/backend

Write-Host "Restoring NuGet packages..."
dotnet restore

Write-Host "Building solution..."
dotnet build --configuration Release --no-restore

Write-Host "Running tests..."
dotnet test --configuration Release --no-build --verbosity minimal

Write-Host "✓ Backend build successful" -ForegroundColor Green

Pop-Location

# Build frontend
Write-Host ""
Write-Host "Building frontend..." -ForegroundColor Yellow
Push-Location src/frontend/live-danmaku-guard-web

Write-Host "Installing dependencies..."
npm ci

Write-Host "Building application..."
npm run build

Write-Host "✓ Frontend build successful" -ForegroundColor Green

Pop-Location

# Summary
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Build completed successfully!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Backend output: src/backend/LiveDanmakuGuard.Api/bin/Release/net8.0/"
Write-Host "Frontend output: src/frontend/live-danmaku-guard-web/dist/"
Write-Host ""
Write-Host "To run the application:"
Write-Host "  Backend:  cd src/backend; dotnet run --project LiveDanmakuGuard.Api --configuration Release"
Write-Host "  Frontend: cd src/frontend/live-danmaku-guard-web; npm run preview"
