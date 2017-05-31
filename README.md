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

## Nginx

### Nginx-extras

This folder contains a Dockerfile which install Nginx with the Lua modules to export statistiques to [Prometheus](https://prometheus.io/docs/introduction/install/)

### Postgresql

This folder contains a Dockerfile which install Postgresql with the following informations : 
  * Database : docker
  * User : docker
  * Password : docker
