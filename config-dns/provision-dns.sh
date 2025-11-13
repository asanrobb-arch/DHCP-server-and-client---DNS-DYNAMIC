#!/bin/bash
set -eux

apt-get update
apt-get install -y bind9 bind9utils

cp /vagrant/ddns-key.conf /etc/bind/

cp /vagrant/config-dns/named.conf.options /etc/bind/
cp /vagrant/config-dns/named.conf.local /etc/bind/

echo 'include "/etc/bind/ddns-key.conf";' >> /etc/bind/named.conf.options

cp /vagrant/config-dns/db.example.test /var/lib/bind/
cp /vagrant/config-dns/db.192 /var/lib/bind/

chown bind:bind /var/lib/bind/db.example.test /var/lib/bind/db.192

systemctl restart bind9