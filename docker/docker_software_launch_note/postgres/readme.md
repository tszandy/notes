notes
cd docker/docker_software_launch_note/postgres

docker compose up
docker compose up -d
docker compose logs
docker attach --detach-keys="ctrl-c" postgres

docker exec -it postgres bash

pg_isready -U user -d db

docker compose down
# remove volumns
docker compose down -v

