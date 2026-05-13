# syntax=docker/dockerfile:1.7

# ---------------------------------------------------------------------------
# b-trace — Dockerfile for documentation checks and future Gradle builds
#
# Current project state:
#   The repository is in the requirements/architecture phase. A Gradle build
#   may be added later. Until then, Docker build stages validate documentation
#   and skip Gradle tasks explicitly.
#
# Usage:
#   docker build -t b-trace:dev .
#   docker build --target docs-check -t b-trace:docs-check .
#   docker build --target build --build-arg GRADLE_TASKS="check" -t b-trace:ci-build .
# ---------------------------------------------------------------------------

FROM gradle:8.12-jdk21 AS base

WORKDIR /src
COPY --chown=gradle:gradle . .

FROM base AS docs-check

RUN ./scripts/verify-doc-refs.sh

FROM base AS build

ARG GRADLE_TASKS="check"

RUN if [ -x ./gradlew ]; then \
      ./gradlew --no-daemon ${GRADLE_TASKS}; \
    elif [ -f build.gradle ] || [ -f build.gradle.kts ] || [ -f settings.gradle ] || [ -f settings.gradle.kts ]; then \
      gradle --no-daemon ${GRADLE_TASKS}; \
    else \
      echo "No Gradle build found yet; running documentation checks only."; \
      ./scripts/verify-doc-refs.sh; \
    fi

FROM build AS runtime

CMD ["bash", "-lc", "echo 'b-trace image built; runtime artifact is not configured yet.'"]
