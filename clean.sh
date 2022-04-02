

docker-compose rm $(docker compose ps -a -q)
docker rm $(docker ps -a -f status=exited -q)
docker rmi $(docker images -a -q)
