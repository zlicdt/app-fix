#!/bin/bash

clear
BLACK="\033[0;30m"  
DARK_GRAY="\033[1;30m"  
BLUE="\033[0;34m"  
LIGHT_BLUE="\033[1;34m"  
GREEN="\033[0;32m"  
LIGHT_GREEN="\033[1;32m"  
CYAN="\033[0;36m"  
LIGHT_CYAN="\033[1;36m"  
RED="\033[0;31m"  
LIGHT_RED="\033[1;31m"  
PURPLE="\033[0;35m"  
LIGHT_PURPLE="\033[1;35m"  
BROWN="\033[0;33m"  
YELLOW="\033[0;33m"  
LIGHT_GRAY="\033[0;37m"  
WHITE="\033[1;37m" 
NC="\033[0m"

echo -e "${LIGHT_CYAN}浅原酱の修复脚本！${NC}"
echo ""
if [ "$#" -ne 1 ]; then
    echo "用法: $0 /Applications/＊.app(绝对路径)"
    exit 1
fi

app_path="$1"
app_name=$(basename "$app_path" .app)
echo -e "「${app_name}  已损坏，无法打开，你应该将它移到废纸篓」"
echo ""
echo ""

if [ -z "$app_path" ]; then
    echo -e "${CYAN}不告诉我APP在哪我怎么搞啊喂！！${NC}"
    exit 1
fi

echo "请在这输入密码："
sudo spctl --master-disable
if [ $? -ne 0 ]; then
    echo -e "${LIGHT_RED}失败了！${NC}"
    exit 1
fi
sudo xattr -rd com.apple.quarantine "$app_path"

echo -e "${LIGHT_CYAN}成功！（可能"
echo ""
echo "如果有阻止了命令的通知请点下允许再执行一次（）"