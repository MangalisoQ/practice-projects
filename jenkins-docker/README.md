# Jenkins-Docker
Jenkins image baked with docker support

## How to build the image
```
docker build -t jenkins-docker .
```

## Run image with mounted docker daemon
```
docker run ... -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker
```