all: build run

build:
	docker build -t sparkfabrik/fortran-cgi .

run: build
	docker rm -vf fcgi || true
	docker run -e DNSDOCK_ALIAS=fortran.api.loc -d --name fcgi -v $$PWD/cgi-bin:/usr/share/nginx/html/cgi-bin sparkfabrik/fortran-cgi

exec:
	docker exec -it fcgi bash
