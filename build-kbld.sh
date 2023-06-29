#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

set -x

kbld -f kbld.yaml

