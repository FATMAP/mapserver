##
# Create the fatmap/mapserver Docker image.
#

FROM fatmap/gdal:2.3-dev

MAINTAINER FATMAP Platform Team <platform@fatmap.com>

# Build the image.
COPY . /tmp/
RUN /tmp/build.sh

VOLUME /maps

ENV MS_MAPFILE "/maps/mapfile.map"
ENV DOC_ROOT "/"
ENV PORT 5000
ENV DEBUG 0                     # 0 or 1
ENV MIN_PROCS 1
ENV MAX_PROCS 3
ENV MAX_LOAD_PER_PROC 4
ENV IDLE_TIMEOUT 20

EXPOSE $PORT

CMD ["lighttpd", "-D", "-f", "/lighttpd.conf"]
