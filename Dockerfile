# Use Bun official image
FROM oven/bun:1.0.29 as build

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies using Bun
RUN bun install

# Build admin panel
RUN bun run build

# Expose default Strapi port
EXPOSE 1337

# Start Strapi server
CMD ["bun", "start"]
