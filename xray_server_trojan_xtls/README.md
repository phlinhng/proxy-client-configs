## auto update xray assets
```
0 7 * * * wget -q https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geoip.dat -O /usr/local/share/xray/geoip.dat >/dev/null 2>&1
0 7 * * * wget -q https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geosite.dat -O /usr/local/share/xray/geosite.dat >/dev/null 2>&1
```
