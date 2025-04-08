# Use Linux Node base image
FROM node:20-alpine

# Install build tools for native modules
RUN apk add --no-cache python3 make g++ libc6-compat

# Set working dir
WORKDIR /app

# Copy only package.json + lock first for layer caching
COPY package*.json ./

# Force rebuild sharp for Linux (this is KEY 🔑)
RUN npm install --platform=linux --arch=x64

# Now copy rest of project
COPY . .

# Build Strapi
RUN npm run build

# Expose port
EXPOSE 1337

# Start
CMD ["npm", "start"]
