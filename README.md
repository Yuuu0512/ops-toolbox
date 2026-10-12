# ops-toolbox

一个纯 Shell 编写的 Linux 迷你运维工具箱，提供系统巡检、磁盘分析、端口查询、日志搜索、用户权限审计、进程管理等常用功能，支持菜单交互与命令行两种调用方式。

## 功能

| 模块 | 命令 | 说明 |
|---|---|---|
| 系统信息 | `ops-toolbox sysinfo` | 主机名、内核、发行版、CPU、内存、磁盘、负载 |
| 磁盘分析 | `ops-toolbox disk [目录] [TopN]` | 磁盘使用率 + 最大目录/文件 |
| 端口查询 | `ops-toolbox port [端口]` | 监听端口与占用进程 |
| 日志搜索 | `ops-toolbox log <关键字> [文件]` | 按关键字搜日志 |
| 用户审计 | `ops-toolbox user` | 可登录用户、UID=0、登录记录、sudo 组 |
| 进程管理 | `ops-toolbox process [关键字]` | CPU/内存 Top 10，或按关键字搜索 |

## 安装

```bash
git clone https://github.com/Yuuu0512/ops-toolbox.git
cd ops-toolbox
chmod +x bin/ops-toolbox install.sh
sudo ./install.sh
