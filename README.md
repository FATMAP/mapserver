# Docker image for MapServer as a FastCGI process.

This image packages MapServer as a separate FastCGI process.  You will need a
FastCGI server to interact with it.  An example using `lighttpd` is provided in
the repository.

MapServer is configured as follows:

```
MapServer version 7.0.7 OUTPUT=PNG OUTPUT=JPEG SUPPORTS=PROJ SUPPORTS=AGG SUPPORTS=FREETYPE SUPPORTS=CAIRO SUPPORTS=ICONV SUPPORTS=FRIBIDI SUPPORTS=WMS_SERVER SUPPORTS=WMS_CLIENT SUPPORTS=WFS_SERVER SUPPORTS=WFS_CLIENT SUPPORTS=WCS_SERVER SUPPORTS=FASTCGI SUPPORTS=GEOS INPUT=JPEG INPUT=POSTGIS INPUT=OGR INPUT=GDAL INPUT=SHAPEFILE
```

## Development

Create a valid mapfile at `./mapfile.map` and run:

    docker-compose up

This will create a container running a `lighttpd` web server attached to a
separate MapServer FastCGI container.  The endpoint will be available at
<http://localhost:8080/>.
