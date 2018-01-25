# Docker image for mapserver

Uses lighttpd with fastcgi.

```
MapServer version 7.0.7 OUTPUT=PNG OUTPUT=JPEG SUPPORTS=PROJ SUPPORTS=AGG SUPPORTS=FREETYPE SUPPORTS=CAIRO SUPPORTS=ICONV SUPPORTS=FRIBIDI SUPPORTS=WMS_SERVER SUPPORTS=WMS_CLIENT SUPPORTS=WFS_SERVER SUPPORTS=WFS_CLIENT SUPPORTS=WCS_SERVER SUPPORTS=FASTCGI SUPPORTS=GEOS INPUT=JPEG INPUT=POSTGIS INPUT=OGR INPUT=GDAL INPUT=SHAPEFILE
```

## Running

Mount a valid [mapfile](http://mapserver.org/mapfile/) in `./maps/mapfile.map`
and run:

```
docker run -v "`pwd`/maps:/maps" -p "5000:5000" fatmap/mapserver:latest
```

## Config

The following environment variables are supported for configuration, along with
their default values:

```
MS_MAPFILE "/maps/mapfile.map"
DOC_ROOT "/"
PORT 5000
DEBUG 0
MIN_PROCS 1
MAX_PROCS 3
MAX_LOAD_PER_PROC 4
IDLE_TIMEOUT 20
```

Changing `MS_MAPFILE` allows you to change then location of your default
mapfile.

## Development

Enter a development environment for the image by running:

    docker-compose run --service-ports mapserver bash

You will be placed in the `/maps` directory which is bind mounted to the
repository root on the host.  From here you can run `lighttpd` to execute
MapServer via FastCGI:

    lighttpd -D -f /maps/lighttpd.conf

Mapserver should now be available at <http://localhost:5000/mapserv>.
