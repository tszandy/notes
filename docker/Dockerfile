# use ubuntu:18.04 as base image
From ubuntu:18.04

# set up default username,UID,GID, or can pass as argument during the docker build process
ARG UNAME=testuser
ARG UID=1000
ARG GID=1000

# add -o non-unique
RUN groupadd -g $GID -o $UNAME

# useradd (-m) create user home directory, (-o) non-unique, (-s /bin/bash $UNAME) login shell with $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

# login as user $UID with group $GID
USER $UID:$GID

# set current work space to /workspace
WORKDIR /workspace
