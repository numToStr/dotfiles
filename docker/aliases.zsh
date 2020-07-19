#!/bin/sh

docker_prune() {
	docker system prune
}

docker_prunef() {
	docker system prune --volumes -af
}
