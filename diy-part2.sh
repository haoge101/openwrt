#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

sed -i "s/^PKG_VERSION:=.*/PKG_VERSION:=2.0.1/" feeds/packages/utils/syncthing/Makefile
sed -i "s/^PKG_HASH:=.*/PKG_HASH:=skip/" feeds/packages/utils/syncthing/Makefile
sed -i "s/option _no_default_folder '1'/option _no_default_folder '0'/" feeds/packages/utils/syncthing/files/syncthing.conf
sed -i 's|IDX_DB=\$(readlink -n "\$home"/index-v0\.14\.0\.db)|IDX_DB=$(readlink -n "$home"/index-v2)|' feeds/packages/utils/syncthing/files/syncthing.init

