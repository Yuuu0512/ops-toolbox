#!/usr/bin/env bash
# 模块4：日志搜索

mod_log() {
    local keyword="${1:-error}"
    local file="${2:-/var/log/syslog}"

    [[ -f "$file" ]] || file="/var/log/messages"
    [[ -f "$file" ]] || { error "找不到日志文件，请指定: mod_log <关键字> <文件>"; return 1; }

    info "在 $file 中搜索关键字: $keyword"
    grep -i --color=auto "$keyword" "$file" | tail -n 50
}
