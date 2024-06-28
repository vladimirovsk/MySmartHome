FROM node:18.16.0

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

ENV NODE_OPTIONS=--openssl-legacy-provider

CMD [ "npm", "start" ]

EXPOSE 8000
