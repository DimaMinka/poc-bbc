#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

. ./config.sh
. ./functions.sh

usage() {
    echo "usage: $0 api-endpoint-base-url external-id file"
    echo "example: $0 https://api.bitbucket.org/internal/repositories/project-slug/repo-slug/commit/commit-sha1/reports 123 path/to/report.json"
    echo "example: $0 https://api.bitbucket.org/internal/repositories/project-slug/repo-slug/commit/commit-sha1/reports/123/annotations 234 path/to/annotation.json"
    exit
}

fatal() {
    echo "fatal: $*" >&2
    exit 1
}

read_saved_token

[[ $# = 3 ]] || usage

api_endpoint_base_url=$1
external_id=$2
file=$3

work=$(mktemp)
trap 'rm -fv "$work"' EXIT

sed -e 's/"external_id": .*/"external_id": "'"$external_id"'",/' "$file" | tee "$work" | jq .

curl -sH"Authorization: Bearer $token" \
    -H "Content-Type: application/json" \
    -X PUT \
    "$api_endpoint_base_url/$external_id" \
    -d@"$work" \
    | jq .
