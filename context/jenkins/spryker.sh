#!/bin/bash

set -e

echo "> ${COMMAND}"

http_response=$(curl --request POST -LsS \
    -o /dev/stderr \
    -w "%{http_code}" \
    --data "APPLICATION_STORE='${APPLICATION_STORE}' COMMAND='${COMMAND}' cli.sh" \
    --max-time 600 \
    --url "http://cli:9000/")

if [ "${http_response}" != "200" ]; then
    exit 1
fi
