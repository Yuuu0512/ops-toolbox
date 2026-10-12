#!/usr/bin/env bash
# 模块6：进程管理

mod_process() {
    local keyword="${1:-}"

    if [[ -n "$keyword" ]]; then
        info "===== 匹配 '$keyword' 的进程 ====="
        ps aux | grep -i --color=auto "$keyword" | grep -v grep || warn "未找到匹配进程"
    else
        info "===== CPU 占用 Top 10 ====="
        ps aux --sort=-%cpu | head -n 11
        echo
        info "===== 内存占用 Top 10 ====="
        ps aux --sort=-%mem | head -n 11
    fi
}
