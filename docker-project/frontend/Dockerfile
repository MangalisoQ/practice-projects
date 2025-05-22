# Stage 1: Build
FROM node:16 AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Execution

FROM node:16-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/build ./build

RUN npm install -g serve

ENV REACT_APP_BACKEND_URL=http://localhost/api

EXPOSE 5000

# create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown appuser:appgroup .
  
 # change the user
USER appuser

CMD ["serve","-s","-l","5000","build"]

