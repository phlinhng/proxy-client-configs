## xray_client_socks5
xray 做為客戶端的配置。內網白名單直連，外網黑名單走代理，沒匹配到的規則默認走代理。

## 客戶端設置
+ HTTP 代理: `localhost:10800`
+ SOCKS5 代理: `localhost:10801`

## geosite 文件
採用 [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)，可用以下指令下載至本地
```sh
wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat -O /usr/local/share/xray/geoip.dat
wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat -O /usr/local/share/xray/geosite.dat
```

## 多配置文件
根據 [V2Fly 文檔](https://www.v2fly.org/config/multiple_config.html#%E8%A7%84%E5%88%99%E8%AF%B4%E6%98%8E):
>在 json 配置中的inbounds和outbounds是数组结构，他们有特殊的规则：
> + 当配置中的数组元素有 2 或以上，覆盖前者的 inbounds/oubounds；
> + 当配置中的数组元素只有 1 个时，查找原有tag相同的元素进行覆盖；若无法找到：
> ++ 对于 inbounds，添加至最后（inbounds 内元素顺序无关）
> ++ 对于 outbounds，添加至最前（outbounds 默认首选出口）；但如果文件名含有 tail（大小写均可），添加至最后。

因此這裡有個坑，只有第一個（被讀取到的）inbounds 配置文件可以在數組中含有 2 個以上的入站規則，後面的每個配置文件只能含有一個入站規則且 tag 不能重複，否則第一個文件的入站規則會被覆蓋掉。