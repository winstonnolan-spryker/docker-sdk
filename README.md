# Spryker Commerce OS — Docker SDK
[![Build Status](https://travis-ci.com/spryker/docker-sdk.svg?branch=master)](https://travis-ci.com/spryker/docker-sdk)

## Description

Spryker Docker SDK helps to set up a Docker environment for your Spryker project.

This repository does not contain a specific Dockerfile or Docker Compose files. It contains a tool that prepares those files to match the infrastructure of your Spryker project.


Spryker Docker SDK reads a [Deploy file](docs/99-deploy-file-reference.v1.md) and builds a production-like Docker infrastructure for Spryker accordingly.

The tool is used for:

1. Building production-like Docker images.
1. Serving as a part of development environment based on Docker.
1. Simplifying the process of setting up a local demo of Spryker project.

## Installing Spryker Docker SDK
> Note: Run all the commands below from the root directory of your Spryker project.

To install the Docker SDK:

1. Fetch Docker SDK tools:
```bash
git clone https://github.com/spryker/docker-sdk.git ./docker
```

> Verification: Make sure `docker 18.09.1+` and `docker-compose 1.23+` have been installed.


2. Initialize Docker setup:

```bash
docker/sdk bootstrap
```

3. Build and run Spryker applications:
```
docker/sdk up
```

## Troubleshooting installation

For installation troubleshooting, see [Troubleshooting installation](docs/09-troubleshooting.md#troubleshooting-installation)

## Documentation

To start working with Spryker in Docker, see [Quick start guide](docs/01-quick-start-guide.md).

## Contributing to Spryker Docker SDK

For contribution guidelines, see [Code contribution guide](https://documentation.spryker.com/docs/code-contribution-guide#code-contribution-guide)

## Supported services

| Service         | Engine       | Version(s)   | ARM support | Note                               |
|-----------------|--------------|--------------|-------------|------------------------------------|
| database        | postgres     | 9.6*         | &check;     |                                    |
|                 |              | 10           | &check;     |                                    |
|                 |              | 11           | &check;     |                                    |
|                 |              | 12           | &check;     |                                    |
|                 | mysql        | 5.7          |             |                                    |
|                 |              | mariadb-10.2 | &check;     |                                    |
|                 |              | mariadb-10.3 | &check;     |                                    |
|                 |              | mariadb-10.4 | &check;     |                                    |
|                 |              | mariadb-10.5 | &check;     |                                    |
| broker          | rabbitmq     | 3.7          |             |                                    |
|                 |              | 3.8          | &check;     |                                    |
|                 |              | 3.9          | &check;     |                                    |
| session         | redis        | 5.0          | &check;     |                                    |
| key_value_store | redis        | 5.0          | &check;     |                                    |
| search          | elastic      | 5.6*         | &check;     | https://www.elastic.co/support/eol |
|                 |              | 6.8          | &check;     | https://www.elastic.co/support/eol |
|                 |              | 7.6          | &check;     |                                    |
|                 |              | 7.10         | &check;     |                                    |
| scheduler       | jenkins      | 2.176        |             |                                    |
|                 |              | 2.305        | &check;     |                                    |
|                 |              | 2.324        | &check;     |                                    |
| webdriver       | phantomjs    | latest*      |             |                                    |
|                 | chromedriver | latest       | &check;     |                                    |
| mail_catcher    | mailhog      | 1.0          | &check;     |                                    |
| swagger         | swagger-ui   | v3.24        | &check;     |                                    |
| kibana          | kibana       | 5.6*         | &check;     | https://www.elastic.co/support/eol |
|                 |              | 6.8          | &check;     | https://www.elastic.co/support/eol |
|                 |              | 7.6          | &check;     |                                    |
|                 |              | 7.10         | &check;     |                                    |
| blackfire       | blackfire    | latest       | &check;     |                                    |
