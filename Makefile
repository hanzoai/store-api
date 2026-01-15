# Hanzo Store API - Development Commands

.PHONY: dev start build test health clean deploy up

# Development server with auto-reload
dev:
	npm run dev

# Production server
start:
	npm start

# Build Docker image
build:
	docker build -t hanzo-store-api .

# Test the API
test: health
	@echo "Testing tools endpoint..."
	@curl -s http://localhost:3003/tools | jq '.[] | {key, name, category}' | head -10

# Health check
health:
	@echo "Health check..."
	@curl -s http://localhost:3003/health | jq .

# Clean up
clean:
	@echo "Stopping any running servers..."
	@pkill -f "node server.js" || true

# Deploy to DigitalOcean
deploy:
	@echo "Deploying to DigitalOcean App Platform..."
	@cd .. && git add store-api/ && git commit -m "Deploy store-api" && git push

# Quick start for development
up: clean
	@echo "Starting store API server..."
	@node server.js &
	@sleep 2
	@make health

# Show usage
help:
	@echo "Hanzo Store API - Available commands:"
	@echo "  make dev      - Start development server with auto-reload"
	@echo "  make start    - Start production server"
	@echo "  make up       - Quick start with health check"
	@echo "  make test     - Run API tests"
	@echo "  make health   - Health check"
	@echo "  make build    - Build Docker image"
	@echo "  make deploy   - Deploy to DigitalOcean"
	@echo "  make clean    - Stop running servers"