#!/bin/bash
set -eux

apt-get update
apt-get install -y dnsutils

dhclient -r enp0s8
dhclient enp0s8

systemctl stop systemd-resolved
systemctl disable systemd-resolved

rm /etc/resolv.conf

cat <<EOF > /etc/resolv.conf
nameserver 192.168.58.10
search example.test
EOF