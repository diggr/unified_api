# unifiedapi

*unifiedapi* is a http api which consists of both the contents of the [koerby](https://github.com/diggr/koerby)-API and the [daft](https://github.com/diggr/daft)-API. Everything is proxied by nginx to serve everything on a single URL/port, and therefore provide a unified advanced programmers interface.

## Prerequisites

Your computer needs docker and docker-compose installed.
Furthermore you need to copy the data into the *koerbyapi* and *daftapi* directories (symlinks will not work). 

## Building the images

Build the images by invoking

```bash
$ make build name=koerby
```

and 

```bash
$ make build name=daft
```

## Save to export to another host

The command

```bash
$ make export name=daft
$ make export name=koerby
```

will save both images as tarball to be put on a remote host.

## Import on remote host

The tarballs with the images can be loaded with

```bash
$ make load name=daft
$ make load name=koerby
```

## Configure the proxy (optional) 

*daft* needs access to the internet. If your server is behind a proxy, 
you need to set the environment variables for the daftapi service. This has to be done in the *docker-compose.yml*.

```yaml
   environment:
      - "HTTP_PROXY=http://proxy.uni-leipzig.de:3128"
      - "HTTPS_PROXY=http://proxy.uni-leipzig.de:3128"
```

## Start the services

Open the *docker-compose.yml* in a text editor of your
choice and enter the correct absolute path for the 
*proxy/nginx.conf*.

```yaml
volumes:
      - ENTER_YOUR_ABSOLUTE_PATH_HERE/proxy/nginx.conf:/etc/nginx/nginx.conf:ro
```

Start everything up, by invoking

```bash
$ docker-compose up -d 
```

## Authors

* F. Rämisch <raemisch@ub.uni-leipzig.de>

## License

GNU AFFERO GENERAL PUBLIC LICENSE 

Copyright 2019,2020 Universitätsbibliothek Leipzig <info@ub.uni-leipzig.de>

