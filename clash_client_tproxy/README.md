## clash_client_tproxy
Clash 做為內網透明代理 Gateway，採用 TPROXY + FakeIP DNS 方案。

## iptables
```sh
# ROUTE RULES
ip rule add fwmark 1 table 100
ip route add local 0.0.0.0/0 dev lo table 100

# CREATE TABLE
iptables -t mangle -N clash

# RETURN LOCAL AND LANS
iptables -t mangle -A clash -d 0.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A clash -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A clash -d 192.168.50.0/16 -j RETURN
iptables -t mangle -A clash -d 192.168.9.0/16 -j RETURN

iptables -t mangle -A clash -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A clash -d 240.0.0.0/4 -j RETURN

# FORWARD ALL
iptables -t mangle -A clash -p udp -j TPROXY --on-port 7893 --tproxy-mark 1
iptables -t mangle -A clash -p tcp -j TPROXY --on-port 7893 --tproxy-mark 1

# REDIRECT
iptables -t mangle -A PREROUTING -j clash
```

## 面版
下載 [haishanh/yacd](https://github.com/haishanh/yacd) 的 release 後解壓縮放入 clash 配置文件目錄（`/usr/local/etc/clash`）的 `dashboard` 文件夾內。
