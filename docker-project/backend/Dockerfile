# Stage 1 : Build 
FROM golang:1.16-alpine AS build

WORKDIR /usr/src/app

COPY go* ./

RUN apk add --no-cache gcc musl-dev

RUN go mod download

COPY . .

RUN go build -o server .

RUN go test ./...

# Stage 2 : Execution

FROM golang:1.16-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/server .

EXPOSE 5002

ENV REDIS_HOST=redis-serv POSTGRES_HOST=db POSTGRES_USER=postgres POSTGRES_PASSWORD=1234 POSTGRES_DATABASE=postgres

# create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown appuser:appgroup .

# change the user
USER appuser

CMD ["./server"]

