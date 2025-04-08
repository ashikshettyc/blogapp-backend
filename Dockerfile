# Dockerfile using Bun
FROM oven/bun:1.0

# Set working directory
WORKDIR /app

# Copy dependencies
COPY bun.lockb package.json ./

# Install dependencies
RUN bun install --production

# Copy source
COPY . .

# Build Strapi Admin panel
RUN bun run build

# Expose the port Strapi will run on
EXPOSE 1337

# Start the server
CMD ["bun", "start"]
