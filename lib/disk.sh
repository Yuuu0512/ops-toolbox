#!/usr/bin/env bash
# 模块2：磁盘分析

mod_disk() {
    local target="${1:-/}"
    local topn="${2:-10}"

    [[ -d "$target" ]] || { error "目录不存在: $target"; return 1; }

    info "===== 磁盘使用率 ====="
    df -hT | grep -vE 'tmpfs|overlay'

    echo
    info "===== $target 下最大的 $topn 个目录 ====="
    du -h --max-depth=1 "$target" 2>/dev/null | sort -hr | head -n "$topn"

    echo
    info "===== $target 下最大的 $topn 个文件 ====="
    find "$target" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n "$topn"
}
