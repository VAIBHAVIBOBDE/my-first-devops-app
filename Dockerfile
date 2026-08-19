# ==========================================
# Stage 1: Build Environment
# ==========================================
FROM node:18-alpine AS builder

WORKDIR /usr/src/app

# Copy package descriptors & install production dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application source code
COPY . .

# ==========================================
# Stage 2: Production Nginx Runtime
# ==========================================
FROM nginx:alpine-slim

# Copy built application assets to Nginx web root
COPY --from=builder /usr/src/app /usr/share/nginx/html

EXPOSE 80

# Production Health Check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]