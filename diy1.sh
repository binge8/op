#!/bin/bash
#添加额外软件包
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/openwrt-packages/luci-app-control-timewol
git clone https://github.com/binge8/luci-theme-argon-mc.git package/openwrt-packages/luci-theme-argon-mc
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
git clone https://github.com/binge8/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/openwrt-packages/luci-theme-atmaterial
git clone https://github.com/1wrt/luci-app-ikoolproxy.git package/openwrt-packages/luci-app-ikoolproxy
svn co https://github.com/0saga0/OpenClash/trunk/luci-app-openclash package/openwrt-packages/luci-app-openclash
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
git clone https://github.com/fw876/helloworld.git package/openwrt-packages/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-packages/luci-app-passwall
git clone https://github.com/ophub/luci-app-amlogic.git package/openwrt-packages/luci-app-amlogic
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/openwrt-packages/luci-app-socat
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/openwrt-packages/luci-app-pushbot
svn co https://github.com/liuran001/openwrt-packages/trunk/luci-app-smartdns package/openwrt-packages/luci-app-smartdns
svn co https://github.com/liuran001/openwrt-packages/trunk/smartdns package/openwrt-packages/smartdns
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/openwrt-packages/luci-app-adguardhome
#更新安装feeds
./scripts/feeds update -a
./scripts/feeds install -a
#设置环境变量
useVersionInfo=$(git show -s --date=short --format="编译前的最后一次[➦主源码](https://github.com/coolsnowwolf/lede)更新记录:<br/>更新人: %an<br/>更新时间: %cd<br/>更新内容: %s<br/>哈希值: %H")
echo "useVersionInfo=$useVersionInfo" >> $GITHUB_ENV
echo "DATE=$(date "+%Y年%m月%d日%H时)" >> $GITHUB_ENV
echo "DATE1=$(date "+%Y.%m.%d")" >> $GITHUB_ENV
