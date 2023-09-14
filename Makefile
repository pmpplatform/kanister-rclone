TAG ?= 1.0.5

docker: 
	docker build --tag pmpplatform/kanister-rclone:$(TAG) .

docker-run: docker
	docker run -it --rm --cap-add=SYS_ADMIN --device /dev/fuse --security-opt apparmor:unconfine -e PUID=1000 -e PGID=1000 -v "$(shell pwd)/rclone.conf:/config/rclone.conf:ro" -v "$(shell pwd)/config.txt:/config/config.txt:ro" pmpplatform/kanister-rclone:$(TAG)

docker-push:
	docker buildx build --tag pmpplatform/kanister-rclone:$(TAG) -o type=image --push --platform=linux/amd64 .

