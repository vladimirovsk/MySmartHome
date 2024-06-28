# Stage 1: Build stage
FROM arm64v8/node:18 AS build

# Установка рабочей директории
WORKDIR /usr/src/app

# Копирование package.json и package-lock.json
COPY package*.json ./

# Установка зависимостей
RUN npm install

# Копирование остального кода приложения
COPY . .

# Сборка приложения
RUN npm run build

# Stage 2: Production stage
FROM node:18-alpine

# Установка рабочей директории внутри контейнера
WORKDIR /usr/src/app

# Копирование собранного приложения из предыдущего образа
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

# Установка переменной окружения NODE_ENV
ENV NODE_ENV=production

# Опционально: установка других переменных окружения или команд для запуска приложения
CMD ["node", "dist/main.js"]
