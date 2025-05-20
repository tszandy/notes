notes
cd docker/docker_software_launch_note/solr

docker compose up --detach

docker compose down

docker volume rm solr_data


docker run --rm -ti solr:8.5.2 /bin/bash
docker run --rm -ti solr:9.8.1 /bin/bash

docker pull solr:9.8.1