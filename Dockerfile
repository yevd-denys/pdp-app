FROM nginx:alpine
WORKDIR /app
COPY /dist/pdp /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ARG VERSION
LABEL version=$VERSION
CMD ["nginx", "-g", "daemon off;"]

