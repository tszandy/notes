export JENKIN_HOME=$HOME/jenkins
docker run --detach \
  --publish 8080:8080 --publish 50000:50000 \
  --name jenkins \
  --restart no \
  --volume $JENKIN_HOME:/var/jenkins_home \
  jenkins/jenkins:lts-jdk17

docker logs -f jenkins

docker start jenkins

docker stop jenkins
