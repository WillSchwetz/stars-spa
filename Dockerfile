FROM nginx:alpine

# Copy all your static files (index.html, styles.css, images, etc.) 
# directly into Nginx's HTML serve directory
COPY . /usr/share/nginx/html

# Copy your local custom nginx config to handle paths securely
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]