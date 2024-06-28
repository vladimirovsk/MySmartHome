# Stage 1: Build stage
FROM node:18-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# Сборка приложения
RUN npm run build

FROM node:18-slim

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist

COPY --from=build /usr/src/app/node_modules ./node_modules

ENV NODE_ENV=production

CMD [ "npm", "run", "start:prod" ]
