#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

: "${BUILDER:="base-jammy"}"
: "${IMAGE:="mamachanko/just-java:kpack"}"

set -x

kp image create \
  mamachanko-just-java-$RANDOM \
  --tag "$IMAGE" \
  --cluster-builder "$BUILDER" \
  --env BP_JVM_VERSION=17 \
  --env BPE_DELIM_JAVA_TOOL_OPTIONS=" " \
  --env BPE_APPEND_JAVA_TOOL_OPTIONS=-XX:ActiveProcessorCount=1 \
  --git https://github.com/mamachanko/just-java.git \
  --git-revision main \
  --namespace workloads
