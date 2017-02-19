.PHONY: release
release: build_release

.PHONY: debug
debug: build_debug

# Pass environment vars such as GIT_OPTIONS to modify build process
.PHONY: build_%
build_%:
	mkdir -p "dist"
	docker run --rm \
		-v $(CURDIR):/mnt:rw \
		-e "DIST_UID=$(shell id -u)" \
		-e "DIST_GID=$(shell id -g)" \
		-e "GIT_OPTIONS=$(GIT_OPTIONS)" \
		-e "GIT_REPO=$(GIT_REPO)" \
		-e "CMAKE_OPTIONS=-DCMAKE_RELEASE_TYPE=$* $(CMAKE_OPTIONS)" \
		"docker.ocf.berkeley.edu/theocf/debian:stretch" \
		/mnt/build-in-docker