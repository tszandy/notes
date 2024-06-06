# gitlab environment
export GITLAB_HOME=$HOME/gitlab
docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab-ee \
  --restart no \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab-ce \
  --restart no \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ce:latest

docker logs -f gitlab-ee
docker logs -f gitlab-ce

docker exec -it gitlab-ee grep 'Password:' /etc/gitlab/initial_root_password # The password file will be automatically deleted in the first reconfigure run after 24 hours.
docker exec -it gitlab-ce "grep 'Password:' /etc/gitlab/initial_root_password" # The password file will be automatically deleted in the first reconfigure run after 24 hours.

docker start gitlab-ee
docker start gitlab-ce

docker stop gitlab-ee
docker stop gitlab-ce

# gitlab backup 
docker exec -it gitlab gitlab-rake gitlab:backup:create
