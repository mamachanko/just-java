#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

kbld -f kbld.yaml

docker run --rm mamachanko/just-java
