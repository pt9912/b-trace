GRADLE ?= ./gradlew
DOCKER ?= docker

IMAGE ?= b-trace
IMAGE_TAG ?= dev
DOCKER_TAG ?= $(IMAGE):dev-targeted

GRADLE_TASKS ?= check
CI_BUILD_TASKS ?= check

.DEFAULT_GOAL := help

.PHONY: help docs-check gates ci ci-build docker-build docker-check docker-test docker-docs-check clean

define run_gradle
	@if [ -x "$(GRADLE)" ]; then \
		$(GRADLE) --no-daemon $(1); \
	elif [ -f build.gradle ] || [ -f build.gradle.kts ] || [ -f settings.gradle ] || [ -f settings.gradle.kts ]; then \
		gradle --no-daemon $(1); \
	else \
		echo "No Gradle build found yet; skipping: gradle $(1)"; \
	fi
endef

help:
	@printf '%s\n' \
		'Targets:' \
		'  make docs-check       Verify Markdown links in README, spec/ and docs/' \
		'  make gates            Run documentation gates' \
		'  make ci               Run Docker CI build and docs-check' \
		'  make ci-build         Run Gradle tasks inside Docker build stage' \
		'  make docker-build     Build the Docker image' \
		'  make docker-check     Run Gradle check inside Docker build stage' \
		'  make docker-test      Run Gradle test inside Docker build stage' \
		'  make docker-docs-check Run Markdown link check inside Docker' \
		'  make clean            Run Gradle clean when available' \
		'' \
		'Variables:' \
		'  GRADLE=./gradlew DOCKER=docker IMAGE=b-trace IMAGE_TAG=dev' \
		'  GRADLE_TASKS=check CI_BUILD_TASKS=check'

docs-check:
	./scripts/verify-doc-refs.sh

gates: docs-check

ci: ci-build docs-check

ci-build:
	$(DOCKER) build --target build \
	  --build-arg GRADLE_TASKS="$(strip $(CI_BUILD_TASKS))" \
	  -t $(IMAGE):ci-build .

docker-build:
	$(DOCKER) build -t $(IMAGE):$(IMAGE_TAG) .

docker-check:
	$(DOCKER) build --target build \
	  --build-arg GRADLE_TASKS="check" \
	  -t $(DOCKER_TAG) .

docker-test:
	$(DOCKER) build --target build \
	  --build-arg GRADLE_TASKS="test" \
	  -t $(DOCKER_TAG) .

docker-docs-check:
	$(DOCKER) build --target docs-check -t $(IMAGE):docs-check .

clean:
	$(call run_gradle,clean)
