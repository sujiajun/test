#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate
# 添加旁路由防火墙
# echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user
# 修改主机名
echo '修改机器名称'
sed -i 's/OpenWrt/Aopen DE2700/g' package/base-files/files/bin/config_generate
# 时区修改
#sed -i "s/timezone='UTC'/timezone='CST-8'/" package/base-files/files/bin/config_generate
#sed -i "/timezone='CST-8'/a set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
#echo '修改时区'
#sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
# 默认主题修改
# sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" package/lean/default-settings/files/zzz-default-settings
#添加cpufrep
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# 修改主机名字，把Xiaomi-R4A修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i '/uci commit system/i\uci set system.@system[0].hostname='Aopen DE2700'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
# sed -i "s/OpenWrt /ababwbq build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改默认wifi名称ssid为Xiaomi_R4A
# sed -i 's/ssid=OpenWrt/ssid=Aopen DE2700/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify WiFi ON
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
