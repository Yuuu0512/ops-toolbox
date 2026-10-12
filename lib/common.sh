#!/usr/bin/env bash
# 公共函数：颜色、日志

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

LOG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../logs" && pwd)"
LOG_FILE="${LOG_DIR}/ops-toolbox.log"

log() {
    local level="$1"; shift
    mkdir -p "$LOG_DIR"
    echo "[$(date '+%F %T')] [$level] $*" >> "$LOG_FILE"
}

info()  { echo -e "${GREEN}[INFO]${NC} $*"; log INFO "$*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; log WARN "$*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; log ERROR "$*"; }

pause() {
    read -r -p "按回车继续..." _
}

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        error "缺少命令: $1，请先安装"
        return 1
    }
}
