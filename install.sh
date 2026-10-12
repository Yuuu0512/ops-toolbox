#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
TARGET="/usr/local/bin/ops-toolbox"

if [[ ! -f "${BASE_DIR}/bin/ops-toolbox" ]]; then
    echo "错误：找不到 bin/ops-toolbox"
    exit 1
fi

sudo ln -sf "${BASE_DIR}/bin/ops-toolbox" "$TARGET"
echo "已安装到 $TARGET"
echo "现在可以直接运行: ops-toolbox"
