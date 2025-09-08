notes
cd docker/docker_software_launch_note/n8n

docker pull n8nio/n8n:latest

docker compose up -d

docker compose down

# remove volumns
docker compose down -v

docker compose config

http://localhost:5678