# docker ubuntu environemnt image with current $UID and $GID
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -f Dockerfile -t tszandy/ubuntu:latest .

# docker ubuntu environment image
docker build -f Dockerfile_ubuntu -t tszandy/ubuntu:latest . 
docker run --rm --name ubuntu -v ${PWD}:/home/ice/program -it tszandy/ubuntu:latest /bin/bash

# nginx environment
docker run --name some-nginx -d -p 8080:80 some-content-nginx

# jenkin environment
docker run --name jenkin -p 8080:8080 -p 50000:50000 -v ~/jenkins_home:/var/jenkins_home jenkins/jenkins

# docker mongo database
docker run --name=mongodb -d -p 27017:27017 mongo:latest
docker exec -it mongodb mongosh

# ubuntu angular environment image
docker rm -f angular
docker build -f Dockerfile_angular -t tszandy/ubuntu_angular:latest .
docker run --name angular -p 0.0.0.0:4200:4200 -ti tszandy/ubuntu_angular:latest /bin/bash
docker start -i angular

#kali images
docker run -it --name kali --net "host" kalilinux/kali /bin/bash

# ubuntu python environment image
docker rm -f python
docker build -f Dockerfile_python -t tszandy/ubuntu_python:latest .
docker run --name python -ti tszandy/ubuntu_python:latest /bin/bash
docker start -i python

# kali images
docker rm -f kali
docker build -f Dockerfile_kali -t tszandy/kalilinux:latest .
docker run --name kali --net "host" -ti tszandy/kalilinux:latest /bin/bash
docker start -i kali

# cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:latest . 
docker run --rm --name cpp -it tszandy/ubuntu_cpp:latest /bin/bash

# windows cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:latest .
docker run --rm --name cpp -v C:\Users\44498\OneDrive\Desktop\program\leetcode\cpp_program:/home/ice/cpp_program -it tszandy/ubuntu_cpp:latest /bin/bash

# ubuntu cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:latest . 
docker run --rm --name cpp -v /home/ice/leetcode/cpp_program:/home/ice/cpp_program -it tszandy/ubuntu_cpp:latest /bin/bash

# mac cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:latest . 
docker run --rm --name cpp -v /Users/weixie/leetcode/cpp_program:/home/ice/cpp_program -it tszandy/ubuntu_cpp:latest /bin/bash

# docker desktop start a container at startup
docker update --restart=always ${container_name}

# docker desktop turn off start a container at startup
docker update --restart=no ${container_name}
