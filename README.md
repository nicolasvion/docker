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

If you are using Windows, you may need to create a **Nat rule** to access the exposed port : 

```
# Adding a port proxy (the command used above):
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=5000 connectaddress=192.168.99.100 connectport=5000

# Showing all existing port proxies:
netsh interface portproxy show v4tov4

# Deleting the same port proxy:
netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=5000
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
