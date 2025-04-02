# Stage 1: Build the Angular application
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the built application with nginx
FROM nginx:alpine
COPY --from=builder /app/dist/pdp /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ARG VERSION
LABEL version=$VERSION
CMD ["nginx", "-g", "daemon off;"]

