# docker mysql
docker run --name=mysql  --restart on-failure -d mysql:latest
docker logs mysql1 2>&1 | grep GENERATED
docker exec -it mysql1 mysql -uroot -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
docker exec -it mysql1 bash
