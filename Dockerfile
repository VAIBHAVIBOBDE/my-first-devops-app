FROM nginx:alpine-slim

# Copy web application assets to Nginx default html folder
COPY . /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Basic Container Healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]