
<<<<<<< HEAD
# ubuntu cpp environment image
docker build -f Dockerfile_cpp -t tszandy/ubuntu_cpp:0.01 . 

# jenkin environment
docker run --name jenkin -u root -rm -d -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean

=======
>>>>>>> 70314c4 (update kali docker image)
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
>>>>>>> 9dbb82c (update python note)
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

#docker command 

#docker list all containers
docker ps -a

#docker list all running containers
docker ps

#docker list all images
docker images

#docker inspect property of container
docker inspect -f ${container_name_or_id}

#docker list ip address of running container ${container_name_or_id}
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${container_name_or_id}

#docker run base ubuntu in detach mode --rm remove container when unrunning -d detach -t tty protocol -i stdin interacitive
docker run --rm -dti --name ubuntu ubuntu:18.04

#docker run nvidia ubuntu runtime --gpus attached all gpu 
docker run --rm --gpus all -dti nvidia/cuda:11.4.1-runtime-ubuntu18.04 /bin/bash

#docker run nvidia ubuntu runtime --gpus attached all gpu 
docker run --rm --gpus all -ti nvidia/cuda:11.4.1-runtime-ubuntu18.04 /bin/bash

# docker remove dangling image
docker rmi $(docker images -f "dangling=true" -q)
docker image prune

# docker rm all unrunning docker containers
docker container prune
docker rm $(docker ps -aq)

# docker attach to a container with detach-key ctrl-a
docker attach ${container_name_or_id} --detach-keys "ctrl-a"

# docker execute command line in a container
docker exec -it ${container_name_or_id} /bin/bash

# docker network
docker network ls
docker network create ${network_name}
docker network rm ${network_name}
docker network inspect ${network_name}
docker inspect ${network_name}

# docker volume
docker volume ls
docker volume create ${volume_name}
docker volume rm ${volume_name}
docker volume inspect ${volume_name}
docker inspect ${volume_name}

# docker save image
docker save ${image_name} > /PATH/${image_name}.tar 

# docker load image
docker load < /PATH/${image_name}.tar 

# docker rm <none> images
docker rmi $(docker images --filter “dangling=true” -q --no-trunc)

# docker start a exist container 
docker start -i ${container_name}
