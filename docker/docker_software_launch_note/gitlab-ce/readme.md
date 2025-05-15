notes
cd docker/docker_software_launch_note/gitlab-ce

docker pull gitlab/gitlab-ce:latest

docker compose up -d

docker compose down

docker volume rm gitlab-ce_gitlab-config
docker volume rm gitlab-ce_gitlab-data
docker volume rm gitlab-ce_gitlab-logs
