#!/bin/bash

wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat -O /usr/local/share/xray/geoip.dat
wget -q https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat -O /usr/local/share/xray/geosite.dat

exit