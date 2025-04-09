# 1. Use Node 20, glibc-based (not Alpine) ✅
FROM node:20-slim

# 2. Install system deps for native packages ✅
RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
  curl \
  && rm -rf /var/lib/apt/lists/*

# 3. Set working directory ✅
WORKDIR /app

# 4. Copy lock + manifest files first (cache optimization) ✅
COPY package.json package-lock.json ./

# 5. Install dependencies using npm ✅
RUN npm install

# 6. Copy full app (after deps installed) ✅
COPY . .

# 7. Build admin panel ✅
RUN npm run build

# 8. Expose the default port ✅
EXPOSE 1337

# 9. Start the app ✅
CMD ["npm", "start"]
