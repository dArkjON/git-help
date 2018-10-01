# docker-help

Delete unused docker images
```sh
docker ps --filter "status=exited" | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker image prune -f
```
