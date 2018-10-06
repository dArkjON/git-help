# docker-help

Delete unused docker images
```sh
docker ps --filter "status=exited" | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker image prune -f
```

## Add Pull-Counter to Repository
[![docker pulls](https://img.shields.io/docker/pulls/dalijolijo/btdx-masternode.svg?style=flat)](https://hub.docker.com/r/dalijolijo/btdx-masternode/)
Use the following code:
```sh
[![docker pulls](https://img.shields.io/docker/pulls/dalijolijo/btdx-masternode.svg?style=flat)](https://hub.docker.com/r/dalijolijo/btdx-masternode/)
``
