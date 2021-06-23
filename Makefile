SHELL := /usr/bin/env bash

REPO = alpine
TAG = latest

.PHONY: build
build:
	docker build -t clair-query .

.PHONY: expose-clair
expose-clair:
	kubectl --context=prod-merit -n sys-clair port-forward svc/clair 6060

# This target is not intended to be called directly by users, since it's
# a modifier for the "run" target
.PHONY: .generate-random-private-image
.generate-random-private-image:
	$(eval REPO := registry.uw.systems/system/clair-query-test)
	$(eval TAG := $(shell uuidgen))
	echo $(TAG) > test/random.txt
	docker build -f test/Dockerfile -t $(REPO):$(TAG) .
	docker push $(REPO):$(TAG)

.PHONY: run
run:
	docker run --rm -ti --add-host=host.docker.internal:host-gateway -e DOCKER_AUTH_CONFIG=$${DOCKER_AUTH_CONFIG} -e QUERY_REPO=$(REPO):$(TAG) -e CLAIR_HOST=http://host.docker.internal:6060 clair-query

.PHONY: test
test: build run

.PHONY: test-full
test-full: build .generate-random-private-image run
