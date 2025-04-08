FROM node:18-slim

# Set working directory
WORKDIR /app

# Install OS-level dependencies required for sharp and SWC
RUN apt-get update && apt-get install -y \
    python3 make g++ libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Build admin panel
RUN npm run build

# Expose default port
EXPOSE 1337

# Start the app
CMD ["npm", "start"]
