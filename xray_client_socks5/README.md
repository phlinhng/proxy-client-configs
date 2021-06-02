## xray_client_socks5
xray 做為客戶端的配置。內網白名單直連，外網黑名單走代理，沒匹配的規則到默認走代理。

## 客戶端設置
+ HTTP 代理: `localhost:10800`
+ SOCKS5 代理: `localhost:10801`

## geosite 文件
採用 [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)，可用以下指令下載至本地
```sh
wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat -O /usr/local/share/xray/geoip.dat
wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat -O /usr/local/share/xray/geosite.dat
```