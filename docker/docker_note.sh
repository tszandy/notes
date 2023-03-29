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






# docker network
docker network connect       # Connect a container to a network
    --alias strings          # Add network-scoped alias for the container
    --driver-opt strings     # driver options for the network
    --ip string              # IPv4 address (e.g., 172.30.100.104)
    --ip6 string             # IPv6 address (e.g., 2001:db8::33)
    --link list              # Add link to another container
    --link-local-ip strings  # Add a link-local address for the container
docker network create        # Create a network
    --attachable             # Enable manual container attachment
    --aux-address map        # Auxiliary IPv4 or IPv6 addresses used by Network driver (default map[])
    --config-from string     # The network from which to copy the configuration
    --config-only            # Create a configuration only network
-d, --driver string          # Driver to manage the Network (default "bridge")
    --gateway strings        # IPv4 or IPv6 Gateway for the master subnet
    --ingress                # Create swarm routing-mesh network
    --internal               # Restrict external access to the network
    --ip-range strings       # Allocate container ip from a sub-range
    --ipam-driver string     # IP Address Management Driver (default "default")
    --ipam-opt map           # Set IPAM driver specific options (default map[])
    --ipv6                   # Enable IPv6 networking
    --label list             # Set metadata on a network
-o, --opt map                # Set driver specific options (default map[])
    --scope string           # Control the network's scope
    --subnet strings         # Subnet in CIDR format that represents a network segment
docker network disconnect    # Disconnect a container from a network
-f, --force                  # Force the container to disconnect from a network
docker network inspect       # Display detailed information on one or more networks
-f, --format string          # Format the output using the given Go template
-v, --verbose                # Verbose output for diagnostics
docker network ls            # List networks
-f, --filter filter          # Provide filter values (e.g. 'driver=bridge')
    --format string          # Pretty-print networks using a Go template
    --no-trunc               # Do not truncate the output
-q, --quiet                  # Only display network IDs
docker network prune         # Remove all unused networks
    --filter filter          # Provide filter values (e.g. 'until=<timestamp>')
-f, --force                  # Do not prompt for confirmation
docker network rm            # Remove one or more networks
