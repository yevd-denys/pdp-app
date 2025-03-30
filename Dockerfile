# Stage 1: Build the Angular application
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the built application with nginx
FROM nginx:alpine
COPY --from=builder /dist/pdp /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

