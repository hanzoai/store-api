# Hanzo Store API - Simple Node.js Server
FROM node:20-slim

WORKDIR /app

# Copy code (no dependencies needed)
COPY server.js ./
COPY package.json ./
COPY data/ ./data/

# Use existing node user
RUN chown -R node:node /app
USER node

# Store API runs on port 3003
EXPOSE 3003

ENV NODE_ENV=production \
    PORT=3003 \
    HOST=0.0.0.0 \
    DATA_DIR=/app/data

CMD ["node", "server.js"]