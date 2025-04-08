# Use official Node.js base image (LTS recommended)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the admin panel
RUN npm run build

# Expose default Strapi port
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "start"]
