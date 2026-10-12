#!/usr/bin/env bash
# 模块3：端口查询

mod_port() {
    require_cmd ss || return 1
    local port="${1:-}"

    if [[ -n "$port" ]]; then
        info "===== 端口 $port 占用情况 ====="
        ss -tulnp | grep -E ":$port\b" || warn "端口 $port 未被监听"
    else
        info "===== 所有监听端口 ====="
        ss -tulnp
    fi
}
