#!/usr/bin/env bash
# 模块8：生成 Markdown 巡检报告

mod_report() {
    local out="${1:-report.md}"

    {
        echo "# Linux 系统巡检报告"
        echo
        echo "生成时间: $(date '+%F %T')"
        echo "主机名: $(hostname)"
        echo
        echo "## 系统信息"
        echo '```'
        echo "内核: $(uname -r)"
        echo "发行版: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
        echo "运行时间: $(uptime -p)"
        echo '```'
        echo
        echo "## 内存"
        echo '```'
        free -h
        echo '```'
        echo
        echo "## 磁盘"
        echo '```'
        df -hT | grep -vE 'tmpfs|overlay'
        echo '```'
        echo
        echo "## CPU 占用 Top 5"
        echo '```'
        ps aux --sort=-%cpu | head -n 6
        echo '```'
    } > "$out"

    info "报告已生成: $out"
}
