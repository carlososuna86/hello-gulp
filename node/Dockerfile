# https://hub.docker.com/_/node

FROM node:11-stretch

# Install net-tools
RUN \
  apt-get update && \
  apt-get install -y net-tools && \
  apt-get clean

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

EXPOSE 8000

CMD ["npm", "start"]
