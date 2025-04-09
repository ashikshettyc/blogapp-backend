# Use Debian-based image for better native support
FROM node:20-slim

# Install dependencies for native modules
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Build admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
