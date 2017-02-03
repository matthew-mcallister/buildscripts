.PHONY: gzdoom
gzdoom: build_gzdoom

.PHONY: slade
slade: build_slade

.PHONY: build_%
build_%:
	mkdir -p "$*/dist"
	docker run --rm -e "DIST_UID=$(shell id -u)" -e "DIST_GID=$(shell id -g)" -v $(CURDIR)/$*:/mnt:rw "docker.ocf.berkeley.edu/theocf/debian:stretch" /mnt/build-in-docker
