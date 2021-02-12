client
dev tun
proto udp
remote ${vpn_dns_name} 443
remote-random-hostname
resolv-retry infinite
nobind
remote-cert-tls server
cipher AES-256-GCM
verb 3
reneg-sec 0

<ca>
${ca}
</ca>

<cert>
${cert}
</cert>

<key>
${key}
</key>