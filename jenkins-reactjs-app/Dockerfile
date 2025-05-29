FROM node:24-bookworm

WORKDIR /usr/home/app

COPY package.json .

RUN npm install -g serve && npm install

COPY . .

RUN npm run build

EXPOSE 5173

CMD ["serve","-s","-l","5173","dist"]