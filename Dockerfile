# Use official Bun image
FROM oven/bun:1.0.27 as base

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install sharp with Linux-compatible flags
RUN apk add --no-cache --virtual .gyp python3 make g++ \
  && bun add sharp --platform=linux --arch=x64 \
  && apk del .gyp

# Install other dependencies
RUN bun install

# Build Strapi admin panel (optional if you're not using build)
RUN bun run build

# Expose the port Strapi uses
EXPOSE 1337

# Start the app
CMD ["bun", "run", "start"]
