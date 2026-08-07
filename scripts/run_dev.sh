#!/usr/bin/env bash
set -e

echo "正在启动..."

./scripts/code.sh \
  --user-data-dir /tmp/agentmol-dev \
  --extensions-dir /tmp/agentmol-ext
