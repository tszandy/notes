# gitlab environment
export GITLAB_HOME=$HOME/gitlab
docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart no \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest
docker logs -f gitlab
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password # The password file will be automatically deleted in the first reconfigure run after 24 hours.

docker start gitlab

docker stop gitlab 

# gitlab backup 
docker exec -it gitlab gitlab-rake gitlab:backup:create
