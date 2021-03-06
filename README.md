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

To register a new image to the docker hub :

```
docker login --username=my-username --email=mail@domain.com
docker tag dca6524b1c1a dntwk/mermaid-cli:0.1
docker push dntwk/mermaid-cli:0.1
```

To clean unused containers and images:

```
docker rm $(docker ps -q -f status=exited)
docker rmi $(docker images -q -f dangling=true)

docker system df && docker container prune && docker volume prune && docker system prune && docker system df
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

## Dockerfiles 

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

### Mermaid Cli

This folder contains a Dockerfile which install [mermaid](https://github.com/knsv/mermaid) to build image from text file.

You need to launch in the container :

```
/bin/bash /data/generate-png.sh
```

This script will generate png files and copy these files to your /tmp folder.
This container is also present on the [Docker Hub](https://hub.docker.com/r/dntwk/mermaid-cli). To pull it :

```
docker pull dntwk/mermaid-cli
```

## Run X11 Application in Docker on Mac OS

```bash
#!/bin/bash

# Install XQuartz
brew cask install xquartz

# Suppress xterm
defaults write org.macosforge.xquartz.X11 app_to_run ''

# Open XQuartz
open -a XQuartz

# Get IP
ip=$(ifconfig en8 | grep inet | awk '$1=="inet" {print $2}')
display_number=`ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9;  }'`
/opt/X11/bin/xhost + $ip

# Run Docker X11 GIMP Image
/usr/local/bin/docker rm gimp
/usr/local/bin/docker run -d --name gimp -e DISPLAY=$ip$display_number -v /tmp/.X11-unix:/tmp/.X11-unix jess/gimp
```
