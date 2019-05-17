# https://hub.docker.com/_/nginx
# https://github.com/nginxinc/docker-nginx/blob/master/mainline/stretch/Dockerfile
# based on debian:stretch-slim
FROM nginx:1.15

EXPOSE 80 443

# Install net-tools
RUN \
  apt-get update && \
  apt-get install net-tools -y && \
  apt-get clean

#CMD ["nginx", "-g", "daemon off;"]

