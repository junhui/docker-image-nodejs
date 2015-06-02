# Docker Image (Node.js)

Reference: https://github.com/ijse/nodejs-docker-image

## How to use on Linux

```bash
git clone https://github.com/junhui/docker-image-nodejs.git

cd docker-image-nodejs

# Development
## Build Image
docker build --force-rm -t junhuih/nvm-dev -f ./Dockerfile_dev .

## Run Image
docker run -it -v /your-folder/app:/workspace -p 3000:8080 junhuih/nvm-dev

## Run App
npm install && node index.js

# Production
## Build Image
docker build --force-rm -t junhuih/nvm -f ./Dockerfile .

## Run Image, the app will automatically running, if you have non 80 port, please change Dockerfile
docker run junhuih/nvm

```

## How to use on windows/MacOS

the only difference between Windows/MacOS and linux is _Windows/MacOS should use boot2docker to host docker_

```bash
# Install boot2docker through http://boot2docker.io/

# Use Git-Bash to run boot2docker start.sh

# At Git-Bash
boot2docker init
boot2docker up
boot2docker ssh

# Then following *How to use on Linux* to start your docker

```
