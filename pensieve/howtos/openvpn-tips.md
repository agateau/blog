public: no
pub_date: 2014-12-10 17:44:00 +01:00
tags: [openvpn, howto]
title: "OpenVPN tips"
disqus: false

## Starting a vpn with a config file

    openvpn --config $config_file

## Get the VPN to setup DNS servers

Install `resolvconf`

Add this to its config file:

    script-security 2
    up /etc/openvpn/update-resolv-conf
    down /etc/openvpn/update-resolv-conf
