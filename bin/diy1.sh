#!/bin/bash
#添加额外软件包
git clone https://github.com/kenzok8/small-package package/openwrt-packages/small-package
git clone https://github.com/kenzok8/small package/openwrt-packages/small
sed -i "/helloworld/d" "feeds.conf.default"
git clone https://github.com/fw876/helloworld package/openwrt-packages/helloworld
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
git clone https://github.com/binge8/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom
svn co https://github.com/WYC-2020/openwrt-packages/trunk/luci-app-eqos package/openwrt-packages/luci-app-eqos
git clone https://github.com/ophub/luci-app-amlogic.git package/openwrt-packages/luci-app-amlogic
#更新安装feeds
./scripts/feeds update -a
./scripts/feeds install -a
#删除重名软件包
rm -rf feeds/luci/applications/luci-app-dockerman feeds/luci/applications/luci-app-pushbot package/openwrt-packages/small-package/luci-app-passwall2 package/openwrt-packages/small-package/ikoolproxy package/openwrt-packages/small-package/luci-app-amlogic
#设置环境变量
useVersionInfo=$(git show -s --date=short --format="编译前的最后一次[➦主源码](https://github.com/coolsnowwolf/lede)更新记录:<br/>更新人: %an<br/>更新时间: %cd<br/>更新内容: %s<br/>哈希值: %H")
echo "useVersionInfo=$useVersionInfo" >> $GITHUB_ENV
echo "DATE=$(date "+%Y年%m月%d日%H时")" >> $GITHUB_ENV
echo "DATE1=$(date "+%Y.%m.%d")" >> $GITHUB_ENV
