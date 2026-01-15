# Hanzo Store API

A lightweight API server that provides tool listings, prompt templates, and default configurations for the Hanzo ecosystem.

## Features

- **Tool Management** - List and manage available tools
- **Prompt Templates** - Store and serve prompt templates  
- **Configuration Storage** - Default configurations and settings
- **Health Monitoring** - Built-in health checks
- **File-based Storage** - Simple JSON file storage

## Quick Start

### Local Development

```bash
# Start the server
npm start

# Or with auto-reload for development
npm run dev
```

### Docker

```bash
# Build the image
docker build -t hanzo-store-api .

# Run the container
docker run -p 3003:3003 hanzo-store-api
```

## API Endpoints

### Health Check
```
GET /health
```

### Tools
```
GET /tools          # List all tools
GET /tools/:key     # Get specific tool
POST /tools         # Add new tool
```

### Prompts
```
GET /prompts        # List all prompts
GET /prompts/:key   # Get specific prompt
POST /prompts       # Add new prompt
```

### Configuration
```
GET /config         # Get default configuration
POST /config        # Update configuration
```

## Configuration

Environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `3003` | Server port |
| `HOST` | `0.0.0.0` | Server host |
| `DATA_DIR` | `./data` | Data storage directory |

## Data Storage

The API stores data in JSON files in the `DATA_DIR`:

```
data/
├── tools.json      # Tool definitions
├── prompts.json    # Prompt templates
└── config.json     # Default configuration
```

## Integration

This service integrates with:

- **LLM Gateway** - Provides tool definitions and configurations
- **Chat Interface** - Serves prompt templates
- **Admin Dashboard** - Configuration management

## Development

### Project Structure

```
store-api/
├── server.js       # Main server implementation
├── package.json    # Node.js package configuration
├── Dockerfile      # Container configuration
├── data/           # JSON data files
└── README.md       # This file
```

### Adding New Tools

Tools are stored in `data/tools.json` with the structure:

```json
{
  "key": "unique_tool_identifier",
  "name": "Tool Name",
  "description": "Tool description",
  "version": "1.0.0",
  "author": "Author Name",
  "category": "tool_category",
  "enabled": true
}
```