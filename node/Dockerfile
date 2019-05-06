# https://hub.docker.com/_/node

FROM node:11-stretch

# Install net-tools
RUN \
  apt-get update && \
  apt-get install -y net-tools && \
  apt-get clean

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

COPY ./html /var/www/html

RUN yarn install

CMD ["npm", "start"]
