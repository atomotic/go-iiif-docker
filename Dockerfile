FROM alpine:latest
MAINTAINER raffaele messuti <raffaele@atomotic.com>

RUN apk add --update alpine-sdk go glib-dev libxml2-dev tiff-dev jpeg-dev imagemagick libwebp-dev giflib-dev libpng-dev libexif-dev \
	&& rm -rf /var/cache/apk/* \
	&& curl -o /tmp/vips-8.4.1.tar.gz http://www.vips.ecs.soton.ac.uk/supported/current/vips-8.4.1.tar.gz \
	&& cd /tmp; tar -zxvf vips-8.4.1.tar.gz \
	&& cd /tmp/vips-8.4.1; ./configure; make; make install \
	&& cd /tmp; git clone https://github.com/thisisaaronland/go-iiif.git \
	&& cd go-iiif; PKG_CONFIG_PATH=/usr/local/lib/pkgconfig make bin \
	&& mkdir /iiif; cp bin/* /iiif; mkdir /images /cache \
	&& apk del alpine-sdk; rm -fr /tmp/vips* /tmp/go-iiif

ADD config.json /etc/iiif-config.json

CMD ["/iiif/iiif-server", "-host", "0.0.0.0", "-config", "/etc/iiif-config.json"]