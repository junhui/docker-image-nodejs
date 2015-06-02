###########
# Usage:
#
#   docker run -it -v <project-resource-directory>:/workspace \
#                  --name <container-name> [image-name]
#
FROM	centos:centos6
MAINTAINER junhuih

RUN yum -y update
RUN yum -y install tar git

# environment
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 0.10.38
ENV WORK_DIR /workspace

# npm & nodejs
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install v$NODE_VERSION \
    && nvm use v$NODE_VERSION \
    && nvm alias default v$NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules  
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# work folder
ADD app/ $WORK_DIR/
RUN cd $WORK_DIR && npm install

# set image port
EXPOSE 80

CMD npm start
