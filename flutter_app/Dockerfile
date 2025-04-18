# # Stage 1: Build the Flutter web app
# FROM ghcr.io/cirruslabs/flutter:stable AS build

# WORKDIR /app

# # Copy source
# COPY . .

# # Install dependencies and build
# RUN flutter pub get && flutter build web

# # Stage 2: Serve via NGINX
# FROM nginx:alpine

# # Copy built web app from previous stage
# COPY --from=build /app/build/web /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]















# Stage 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Set working directory inside container
WORKDIR /app

# Copy the source code to the container
COPY . .

# Install dependencies and build the Flutter web app
RUN flutter pub get && flutter build web

# Stage 2: Serve via NGINX
FROM nginx:alpine

# Copy the built web app from the previous stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 for serving the web app
EXPOSE 80

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
