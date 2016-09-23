# go-iiif-docker

clone and build the docker image

	~ git clone https://github.com/atomotic/go-iiif-docker.git
	~ cd go-iiif-docker
	~ docker build -t go-iiif .

samples:

	~ mkdir images
	~ #copy some images in ./images

run

	~ docker run -p 8080:8080 -v $(pwd)/images:/images go-iiif
	

test

 	~ curl -I localhost:8080/test.tif/full/full/0/dither.jpg
	HTTP/1.1 200 OK
	Content-Type: image/jpeg
	Date: Fri, 23 Sep 2016 18:39:04 GMT