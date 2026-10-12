#!/usr/bin/env bash
# 模块7：网络检测

mod_net() {
    local host="${1:-8.8.8.8}"

    info "===== 本机网络 ====="
    ip -brief addr show | grep -v LOOPBACK

    echo
    info "===== 默认网关 ====="
    ip route | grep default || warn "无默认网关"

    echo
    info "===== DNS 配置 ====="
    grep nameserver /etc/resolv.conf 2>/dev/null || warn "无 DNS 配置"

    echo
    info "===== 连通性测试: $host ====="
    if ping -c 3 -W 2 "$host" >/dev/null 2>&1; then
        info "$host 可达"
        ping -c 3 -W 2 "$host" | tail -n 2
    else
        warn "$host 不可达"
    fi

    echo
    info "===== 监听端口 ====="
    ss -tulnp | head -n 20
}
