# Stage 1: Build stage
FROM node:18.16.0 AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

RUN npm run build

FROM node:18.16.0-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

COPY package*.json ./

ENV NODE_ENV=production

