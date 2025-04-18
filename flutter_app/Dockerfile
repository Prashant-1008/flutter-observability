# Stage 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Copy source
COPY . .

# Install dependencies and build
RUN flutter pub get && flutter build web

# Stage 2: Serve via NGINX
FROM nginx:alpine

# Copy built web app from previous stage
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
