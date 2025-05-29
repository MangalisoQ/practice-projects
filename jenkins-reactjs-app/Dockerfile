# =========================================
# Stage 1: Build the React.js Application
# =========================================

FROM node:24-alpine3.20 AS build

WORKDIR /usr/home/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


# =========================================
# Stage 2: Run the React.js Application
# =========================================

FROM node:24-alpine3.20

WORKDIR /usr/home/app

COPY --from=build /usr/home/app/dist ./dist

RUN npm install -g serve

EXPOSE 8080

CMD ["serve","-s","-l","8080","dist"]