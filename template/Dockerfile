# Base image
FROM node:18 AS build

# Set environment variable
ENV NODE_ENV=production

# Set build arguments
ARG PORT=3000

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE $PORT

# Define entrypoint
ENTRYPOINT ["node", "server.js"]

# Label metadata
LABEL maintainer="YourName <your.email@example.com>"
LABEL description="A sample Dockerfile to test VSCode theme"

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:$PORT || exit 1
