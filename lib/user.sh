#!/usr/bin/env bash
# 模块5：用户权限审计

mod_user() {
    info "===== 可登录用户 ====="
    awk -F: '$7 !~ /(nologin|false)$/ {print $1, $3, $6, $7}' /etc/passwd

    echo
    info "===== UID=0 的用户（应只有 root）====="
    awk -F: '$3==0 {print $1}' /etc/passwd

    echo
    info "===== 最近登录记录 ====="
    last -n 10 2>/dev/null || warn "last 命令不可用"

    echo
    info "===== sudo / wheel 组成员 ====="
    getent group sudo 2>/dev/null || getent group wheel 2>/dev/null || warn "无 sudo/wheel 组"
}
