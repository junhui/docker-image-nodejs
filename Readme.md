# Docker Image (Node.js)


## How to use on Linux

```bash
git clone https://github.com/junhui/docker-image-nodejs.git

cd docker-image-nodejs

# Development
## Build Image
docker build --force-rm -t junhuih/nvm-dev -f ./Dockerfile_dev .

## Run Image
docker run -it -v /your-folder/app:/workspace -p 3000:80 junhuih/nvm-dev

## Run App
npm install && node index.js

# Production
## Build Image
docker build --force-rm -t junhuih/nvm -f ./Dockerfile .

## Run Image, the app will automatically running
## , if you have non 80 port, please change Dockerfile
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

### Shared folder

On windows, if you want to use shared folder through windows-host-->boot2docker-vm-->docker-container, please see following

```bash
boot2docker stop
 
/c/Program\ Files\Oracle/VirtualBox/VBoxManage.exe sharedfolder add boot2docker-vm --name shared --hostpath /d/docker
 
boot2docker start
 
boot2docker ssh
 
sudo mkdir -p /mnt/shared
sudo mount -t vboxsf shared /mnt/shared
```

### Develop Node.js in windows shared folder, symlinks issue

#### solution 1:

http://www.ahtik.com/blog/fixing-your-virtualbox-shared-folder-symlink-error/
 
#### solution 2:

`--no-bin-links` tells npm to not create any symbolic links. There isn't a way (to my knowledge) of translating symlinks to a windows share.

```npm install --no-bin-links```


### Networking

Also need set expose port on boot2docker-vm and also docker container.

http://www.deadcodersociety.org/blog/forwarding-a-range-of-ports-in-virtualbox/

## References:

- https://www.ijser.cn/docker-commands/
- https://github.com/ijse/nodejs-docker-image
- http://www.csdn.net/article/2014-08-08/2820312-Docker-lxc-paas-virtualization
- https://github.com/zackshen/docker-dev-build


