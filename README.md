Docker-in-Docker
=============

Requirement
-------------
- Docker 1.8.x or newer

Usage
-------------
```
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock mrmoneyc/dind docker version
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock mrmoneyc/dind docker-compose version
```

Reference
-------------
[Official Installation Guide on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
