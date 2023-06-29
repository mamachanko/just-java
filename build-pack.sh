#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

: "${BUILDER:="paketobuildpacks/builder-jammy-tiny"}"
: "${IMAGE:="mamachanko/just-java:pack"}"

set -x

pack build \
  "$IMAGE" \
  --builder "$BUILDER" \
  --env=BP_JVM_VERSION=17 \
  --env=BPE_DELIM_JAVA_TOOL_OPTIONS=" " \
  --env=BPE_APPEND_JAVA_TOOL_OPTIONS=-XX:ActiveProcessorCount=1

