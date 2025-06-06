#docker command 
https://docs.docker.com/engine/reference/commandline/cli/
https://docs.docker.com/compose/reference/
https://docs.docker.com/engine/reference/commandline/dockerd/

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
docker run --rm -ti --name ubuntu ubuntu:18.04
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

# docker rm all docker containers match ${partial_name}
docker rm $(docker ps -aq --filter ${partial_name})

# docker attach to a container with detach-key ctrl-a
docker attach ${container_name_or_id} --detach-keys "ctrl-a"

# docker execute command line in a container
docker exec -it ${container_name_or_id} /bin/bash

# Remove all unused data, including stopped containers, networks not used by at least one container, dangling images, and build cache
docker system prune -a

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

docker logs -f ${container_name}


# docker list resources
docker container ls -a
docker container ls
docker network ls
docker images 
docker volume ls

# docker prune resources
docker container prune
docker network prune


# docker clean up 
docker compose down
docker system prune

# keep container up
tail -f /dev/null
