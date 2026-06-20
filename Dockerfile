# Build stage (optional, if you use React/Vue/Vite)
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
# Copy the compiled static assets to the container's serve folder
COPY --from=build /app/dist /usr/share/nginx/html
# Ensure SPA routing works (redirects all 404s to index.html)
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]