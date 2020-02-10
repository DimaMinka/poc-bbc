#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

. ./config.sh
. ./functions.sh

usage() {
    echo "usage: $0 api-endpoint-url"
    echo "example: $0 https://api.bitbucket.org/2.0/repositories/project-slug/repo-slug"
    exit
}

fatal() {
    echo "fatal: $*" >&2
    exit 1
}

read_saved_token

[[ $# = 1 ]] || usage

api_endpoint_url=$1

curl -sH"Authorization: Bearer $token" \
    -X DELETE \
    "$api_endpoint_url" \
    | jq .
