FROM alpine:latest AS build

# Install Hugo
RUN apk add --no-cache hugo

# Build site
COPY . /app
WORKDIR /app
RUN hugo --minify

# Serve
FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
EXPOSE 80
