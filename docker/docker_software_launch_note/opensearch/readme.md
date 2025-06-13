notes
cd docker/docker_software_launch_note/opensearch

$env:OPENSEARCH_INITIAL_ADMIN_PASSWORD="<strong-password>"
export OPENSEARCH_INITIAL_ADMIN_PASSWORD=<strong-password>

docker compose up -d

docker compose down
# remove volumns
docker compose down -v
