FROM node:18.16.0

WORKDIR /usr/src/app

COPY package*.json ./

COPY tsconfig.json ./

RUN npm install

COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build

CMD [ "npm", "start:prod" ]

EXPOSE 8000
