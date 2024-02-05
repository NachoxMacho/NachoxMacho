docker-build:
	docker build . -t nachoxmacho-dev:latest

docker-run:
	docker run --rm -it --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor:unconfined --entrypoint /bin/bash nachoxmacho-dev
