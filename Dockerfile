# Stage 1: Build stage
FROM arm64v8/node:18.9-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:18.9-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

ENV NODE_ENV=production

CMD ["node", "dist/main.js"]
