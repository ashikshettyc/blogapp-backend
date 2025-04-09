FROM node:20-alpine

# Needed for native modules
RUN apk add --no-cache python3 make g++ libc6-compat

# Set workdir
WORKDIR /app

# Copy files
COPY . .

# Install deps
RUN npm install

# Important: Rebuild native modules like @swc/core
RUN npm rebuild @swc/core

# Build the admin
RUN npm run build

# Expose port
EXPOSE 1337

CMD ["npm", "start"]
