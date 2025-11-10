#!/bin/bash
set -eux

apt-get update
apt-get install -y bind9 bind9utils

cat <<EOF > /etc/bind/ddns-key.conf
key "ddns-key" {
    algorithm hmac-sha256;
    secret "Nysf8V0a3e3bEcM/Vvnyq5kC/O6sGxYV46WH3nsf4EA=";
};
EOF

cp /vagrant/config-dns/named.conf.options /etc/bind/
cp /vagrant/config-dns/named.conf.local /etc/bind/
cp /vagrant/config-dns/db.example.test /etc/bind/
cp /vagrant/config-dns/db.192 /etc/bind/

cat /etc/bind/ddns-key.conf >> /etc/bind/named.conf.options

chown bind:bind /etc/bind/db.example.test /etc/bind/db.192
chmod 664 /etc/bind/db.example.test /etc/bind/db.192

systemctl restart bind9