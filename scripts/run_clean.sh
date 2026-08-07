#!/usr/bin/env bash
# 先清理配置文件再启动, 每次启动都恢复出厂配置
set -e

# SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# echo "$SCRIPT_DIR"
# cd "$SCRIPT_DIR"

rm -rf /tmp/agentmol-dev
rm -rf /tmp/agentmol-ext
echo "临时配置和扩展目录已清理"

./scripts/code.sh \
  --user-data-dir /tmp/agentmol-dev \
  --extensions-dir /tmp/agentmol-ext
