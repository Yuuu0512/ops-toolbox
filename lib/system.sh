#!/usr/bin/env bash
# 模块1：系统信息概览（带阈值告警）

mod_sysinfo() {
    info "===== 系统信息 ====="
    echo "主机名   : $(hostname)"
    echo "内核     : $(uname -r)"
    echo "发行版   : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "运行时间 : $(uptime -p)"
    echo "当前用户 : $(whoami)"
    echo
    echo "----- CPU -----"
    lscpu | grep -E 'Model name|^CPU\(s\)' || true
    echo
    echo "----- 内存 -----"
    free -h
    echo
    echo "----- 磁盘（超阈值标色）-----"
    df -hT | grep -vE 'tmpfs|overlay' | while read -r line; do
        local use
        use=$(echo "$line" | awk '{print $6}' | tr -d '%')
        if [[ "$use" =~ ^[0-9]+$ ]]; then
            if (( use >= ${DISK_CRIT_THRESHOLD:-90} )); then
                echo -e "${RED}${line}${NC}"
            elif (( use >= ${DISK_WARN_THRESHOLD:-80} )); then
                echo -e "${YELLOW}${line}${NC}"
            else
                echo "$line"
            fi
        else
            echo "$line"
        fi
    done
    echo
    echo "----- 负载 -----"
    uptime
}
