public: no
pub_date: 2017-11-19 13:02:58 +01:00
tags: [howto, network]
title: "IP Routing"
disqus: false

    sudo -s
    modprobe ipt_MASQUERADE
    iptables -F; iptables -t nat -F; iptables -t mangle -F

    # Replace wlp3s0 with the interface connected to the Internet
    iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

    echo 1 > /proc/sys/net/ipv4/ip_forwardt

Stolen from <http://tldp.org/HOWTO/Masquerading-Simple-HOWTO/summary.html>
