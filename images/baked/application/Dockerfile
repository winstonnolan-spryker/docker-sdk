# syntax = docker/dockerfile:experimental
ARG SPRYKER_PARENT_IMAGE

FROM ${SPRYKER_PARENT_IMAGE} AS application-production-dependencies
ARG SPRYKER_COMPOSER_MODE

USER spryker
# Install composer modules for Spryker
COPY --chown=spryker:spryker composer.json composer.lock ${srcRoot}/
RUN --mount=type=cache,id=composer,sharing=locked,target=/home/spryker/.composer/cache,uid=1000 \
  --mount=type=ssh,uid=1000 --mount=type=secret,id=secrets-env,uid=1000 \
  set -o allexport && . /run/secrets/secrets-env && set +o allexport \
  && composer install --no-scripts --no-interaction ${SPRYKER_COMPOSER_MODE} -vvv \
  && composer dump-autoload -o

FROM scratch as root-directory-builder
COPY src /src/
COPY data /data/
COPY config /config
COPY public /public
COPY frontend /frontend
COPY *.php .* *.* LICENSE .yarn* /

FROM ${SPRYKER_PARENT_IMAGE} AS application-production-codebase-builder
ARG SPRYKER_PIPELINE
ARG APPLICATION_ENV
ARG SPRYKER_DB_ENGINE
ARG SPRYKER_COMPOSER_AUTOLOAD

ENV APPLICATION_ENV=${APPLICATION_ENV} SPRYKER_DB_ENGINE=${SPRYKER_DB_ENGINE}

COPY --from=application-production-dependencies --chown=spryker:spryker ${srcRoot}/ ${srcRoot}/
COPY --from=root-directory-builder --chown=spryker:spryker / ${srcRoot}/

RUN --mount=type=cache,id=composer,sharing=locked,target=/home/spryker/.composer/cache,uid=1000 \
    chmod 600 ${srcRoot}/config/Zed/*.key 2>/dev/null || true \
    && vendor/bin/install -r ${SPRYKER_PIPELINE} -s build -s build-production -vvv \
    && composer dump-autoload ${SPRYKER_COMPOSER_AUTOLOAD}

FROM ${SPRYKER_PARENT_IMAGE} AS application-production-codebase
ARG SPRYKER_PIPELINE
ARG APPLICATION_ENV
ARG SPRYKER_DB_ENGINE

ENV APPLICATION_ENV=${APPLICATION_ENV} SPRYKER_DB_ENGINE=${SPRYKER_DB_ENGINE} SPRYKER_PIPELINE=${SPRYKER_PIPELINE}
COPY --from=application-production-codebase-builder --chown=spryker:spryker ${srcRoot}/ ${srcRoot}/

USER root
RUN chown -R spryker:spryker /home/spryker

ARG SPRYKER_BUILD_HASH='current'
ARG SPRYKER_BUILD_STAMP=''
ENV SPRYKER_BUILD_HASH=${SPRYKER_BUILD_HASH} SPRYKER_BUILD_STAMP=${SPRYKER_BUILD_STAMP}

CMD [ "php-fpm", "--nodaemonize" ]
EXPOSE 9000
