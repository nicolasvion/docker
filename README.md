# Docker repository

To build:
```
make build
```

To run:
```
make run
```

To connect a shell:
```
docker ps
docker exec -it $INSTANCE_ID /bin/bash
```

To delete all containers and images:

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi $(docker images -q)
```

## Nginx

### Nginx-extras

This folder contains a Dockerfile which install Nginx with the Lua modules to export statistiques to [Prometheus](https://prometheus.io/docs/introduction/install/)

The following ports are exposed :
  * 80
  * 443
  * 9913

### Postgresql

This folder contains a Dockerfile which install Postgresql with the following informations :
  * Database : docker
  * User : docker
  * Password : docker

The following ports are exposed :
  * 5432

### Redis

This folder contains a Dockerfile which install Redis v3.

The following ports are exposed :
  * 6379
