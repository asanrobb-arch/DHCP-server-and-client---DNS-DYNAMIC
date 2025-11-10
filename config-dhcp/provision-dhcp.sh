#!/bin/bash
set -eux

apt-get update
apt-get install -y isc-dhcp-server

echo 'INTERFACESv4="enp0s8"' > /etc/default/isc-dhcp-server

cp /vagrant/config-dhcp/dhcpd.conf /etc/dhcp/

systemctl restart isc-dhcp-server