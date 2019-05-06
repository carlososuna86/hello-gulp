# https://hub.docker.com/_/node

FROM node:11-stretch

# Install net-tools
RUN \
  apt-get update && \
  apt-get install -y net-tools && \
  apt-get clean

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./html /usr/src/app

RUN yarn install

EXPOSE 8000

CMD ["npm", "start"]
