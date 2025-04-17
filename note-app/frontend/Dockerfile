FROM node:23-alpine3.20

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install &&  npm install -g vite

COPY . .

EXPOSE 5173

CMD ["npm","run","dev"]
