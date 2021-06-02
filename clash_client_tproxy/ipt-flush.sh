#!/bin/bash

# reset ip rules
ip rule del pref `ip rule show | grep "from all fwmark 0x1 lookup 100" | sed 's/:\s.*$//' | head -n 1`
ip route del local 0.0.0.0/0 dev lo table 100

# reset iptables
iptables -t mangle -F clash
iptables -t mangle -X clash

exit