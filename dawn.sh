#!/bin/bash

# 脚本保存路径
INSTALL_DIR="$PWD/Dawn"

# 安装和配置函数
install_dawn() {
    echo "检查并安装 Python 3.10+"
}

# 主菜单
main_menu() {
    while true; do
        clear
        echo "如有问题，可联系推特 @ddazmon，仅此只有一个号"
        echo "请选择要执行的操作:"
        echo "1. 安装Dawn"
        echo "2. 退出"
        read -p "选择操作 (1, 2): " choice

        case $choice in
            1) install_dawn ;;
            2) echo "退出脚本..."; exit 0 ;;
            *) echo "无效的选择，请重试。"; sleep 2 ;;
        esac
    done
}

# 运行主菜单
main_menu