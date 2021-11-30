# syntax = docker/dockerfile:experimental
ARG SPRYKER_PARENT_IMAGE

FROM ${SPRYKER_PARENT_IMAGE} AS assets-builder

USER spryker

COPY --chown=spryker:spryker package.json package-lock.json ${srcRoot}/
COPY --chown=spryker:spryker frontend* ${srcRoot}/frontend
COPY --chown=spryker:spryker tsconfig*.json ${srcRoot}/
COPY --chown=spryker:spryker config/Yves ${srcRoot}/config/Yves

ARG SPRYKER_ASSETS_MODE='development'
ENV SPRYKER_ASSETS_MODE=${SPRYKER_ASSETS_MODE}
ARG SPRYKER_PIPELINE
ENV SPRYKER_PIPELINE=${SPRYKER_PIPELINE}
ENV YARN_CACHE_FOLDER=/tmp/.yarn/cache

RUN --mount=type=cache,id=npm,sharing=locked,target=/tmp/.npm \
    --mount=type=cache,id=yarn,sharing=locked,target=/tmp/.yarn/cache,uid=1000 \
    echo "BUILD HASH: ${SPRYKER_BUILD_HASH}" \
    && echo "MODE: ${SPRYKER_ASSETS_MODE}" \
    && vendor/bin/install -r ${SPRYKER_PIPELINE} -s build-static -s build-static-${SPRYKER_ASSETS_MODE} -vvv
