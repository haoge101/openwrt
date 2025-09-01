#!/bin/bash
# ./scripts/feeds update -a 后 <<<<  diy-part3.sh >>>> ./scripts/feeds install -a 前


# 1. 获取 Syncthing 最新版本号
LATEST=$(curl -s https://api.github.com/repos/syncthing/syncthing/releases/latest \
  | grep '"tag_name":' \
  | sed -E 's/.*"v?([^"]+)".*/\1/')

# 2. OpenWrt syncthing Makefile 路径
MAKEFILE="feeds/packages/utils/syncthing/Makefile"

# 3. 替换 Makefile 中的 PKG_VERSION
sed -i -E "s/^(PKG_VERSION:)=.*/\1 $LATEST/" "$MAKEFILE"

# 4. 显示PKG_VERSION
# 提取 version
VERSION=$(grep -E '^PKG_VERSION:=' "$MAKEFILE" | sed 's/PKG_VERSION:=//g' | tr -d '[:space:]')
echo "Current version in Syncthing Makefile: $VERSION"
