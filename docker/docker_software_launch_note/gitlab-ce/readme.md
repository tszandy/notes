notes
cd docker/docker_software_launch_note/gitlab-ce

docker pull gitlab/gitlab-ce:latest

docker compose up -d

docker compose down

http://localhost/

docker volume rm gitlab-ce_config
docker volume rm gitlab-ce_data
docker volume rm gitlab-ce_log
