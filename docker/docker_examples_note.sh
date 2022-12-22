# docker ubuntu environment image
docker build -f Dockerfile_ubuntu -t tszandy/ubuntu:0.01 . 
docker run --rm --name ubuntu -v ${PWD}:/home/ice/program -it tszandy/ubuntu:0.01 /bin/bash

# ubuntu cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 

# gitlab environment
export GITLAB_HOME=$HOME/gitlab
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

# nginx environment
docker run --name some-nginx -d -p 8080:80 some-content-nginx

# solr environment
docker run --name solr -p 8983:8983 -t solr

docker run --name solr8.5.2 -p 8983:8983 -t solr:8.5.2

# jenkin environment
docker run --name jenkin -p 8080:8080 -p 50000:50000 -v ~/jenkins_home:/var/jenkins_home jenkins/jenkins

# jenkin environment
docker run --name jenkin -u root -rm -d -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean

# ubuntu angular environment image
docker rm -f angular
docker build -f Dockerfile_angular -t tszandy/ubuntu_angular:0.01 . && docker run --name angular -p 0.0.0.0:4200:4200 -ti tszandy/ubuntu_angular:0.01 /bin/bash
docker run --name angular -p 0.0.0.0:4200:4200 -ti tszandy/ubuntu_angular:0.01 /bin/bash
docker start -i angular

#kali images
docker run -it --name kali --net "host" kalilinux/kali /bin/bash

# ubuntu python environment image
docker rm -f python
docker build -f Dockerfile_python -t tszandy/ubuntu_python:0.01 . && docker run --name python -ti tszandy/ubuntu_python:0.01 /bin/bash
docker run --name python -ti tszandy/ubuntu_python:0.01 /bin/bash
docker start -i python

# kali images
docker rm -f kali
docker build -f Dockerfile_kali -t tszandy/kalilinux:0.01 . && docker run --name kali --net "host" -ti tszandy/kalilinux:0.01 /bin/bash
docker run --name kali --net "host" -ti kalilinux/kali /bin/bash
docker start -i kali

# cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 

# windows cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 
docker run --rm --name cpp -v C:\Users\44498\Desktop\leetcode\cpp_program:/home/wei/cpp_program -it tszandy/ubuntu_cpp:0.01 /bin/bash

# ubuntu cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 
docker run --rm --name cpp -v /home/ice/leetcode/cpp_program:/home/wei/cpp_program -it tszandy/ubuntu_cpp:0.01 /bin/bash

# mac cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 
docker run --rm --name cpp -v /Users/weixie/leetcode/cpp_program:/home/wei/cpp_program -it tszandy/ubuntu_cpp:0.01 /bin/bash

