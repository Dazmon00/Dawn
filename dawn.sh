#!/bin/bash

# 脚本保存路径
INSTALL_DIR="$PWD/Dawn"

# 安装和配置函数
install_dawn() {
    echo "检查并安装 Python 3.10+"
    if ! command -v python3 &>/dev/null || [[ ! "$(python3 --version)" =~ ^Python\ 3\.[1-9][0-9].* ]]; then
        echo "Python 3.10 或更高版本未安装，正在安装..."
        brew install python@3.10 || { echo "安装 Python 失败。请检查您的 Homebrew 安装。"; exit 1; }
    fi

    echo "检查并删除已存在的目录"
    for dir in "$INSTALL_DIR" ; do
        echo "Python 3.10 或更高版本未安装，正在安装..."
        [ -d "$dir" ] && rm -rf "$dir"
    done

    echo "更新包管理器并安装必要工具"
    brew update && brew install git tmux || { echo "安装必要工具失败。"; exit 1; }

    echo "克隆仓库"
    git clone -q "https://github.com/Dazmon00/Dawn.git" "$INSTALL_DIR" || { echo "克隆 Dawn 仓库失败。"; exit 1; }

    echo "设置虚拟环境并安装依赖"
    cd "$INSTALL_DIR" || exit
    python3 -m venv venv
    source "venv/bin/activate"
    python3 -m pip install -r requirements.txt httpx || { echo "安装 Python 依赖失败。"; exit 1; }

    echo "启动脚本"
    start_script "dawn" "run_test.py"
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