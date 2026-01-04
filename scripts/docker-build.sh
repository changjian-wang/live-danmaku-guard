#!/bin/bash
# Docker Build Script for LiveDanmakuGuard

set -e

echo "======================================"
echo "LiveDanmakuGuard Docker Build"
echo "======================================"

# Build Docker images
echo "Building Docker images..."
docker-compose build

echo ""
echo "✓ Docker images built successfully!"
echo ""
echo "To start the application:"
echo "  docker-compose up -d"
echo ""
echo "To stop the application:"
echo "  docker-compose down"
echo ""
echo "To view logs:"
echo "  docker-compose logs -f"
