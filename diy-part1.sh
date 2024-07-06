#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf package/lean/luci-app-argon-config
rm -rf feeds/packages/lang/golang

# golong 
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# argon主题
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/downloads/luci-theme-argon

# Mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone -b main https://github.com/oppen321/luci-app-mosdns package/mosdns
git clone -b main https://github.com/oppen321/v2ray-geodata package/v2ray-geodata

# kenzo源 科学上网插件与依赖
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# openclash
git clone -b main https://github.com/oppen321/openclash package/openclash

# istoreos商店
git clone -b main https://github.com/linkease/istore-ui package/istoreos-ui
git clone -b main https://github.com/linkease/istore package/istoreos

# Adguardhome
git clone -b main https://github.com/oppen321/luci-app-adguardhome package/luci-app-adguardhome

# OpenAppFilter应用过滤
git clone -b main https://github.com/oppen321/OpenAppFilter package/OpenAppFilter


./scripts/feeds update -a
./scripts/feeds install -a
