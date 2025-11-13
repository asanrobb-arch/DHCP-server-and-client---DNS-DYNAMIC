# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Servidor DNS (BIND9)
  config.vm.define "dns" do |dns|
    dns.vm.hostname = "dns"
    dns.vm.network "private_network", ip: "192.168.58.10", virtualbox__intnet: "ddns-net"
    dns.vm.provision "shell", path: "config-dns/provision-dns.sh"
  end

  # Servidor DHCP (ISC-DHCP-Server)
  config.vm.define "dhcp" do |dhcp|
    dhcp.vm.hostname = "dhcp"
    dhcp.vm.network "private_network", ip: "192.168.58.20", virtualbox__intnet: "ddns-net"
    dhcp.vm.provision "shell", path: "config-dhcp/provision-dhcp.sh"
  end

  # Cliente
  config.vm.define "c1" do |c1|
    c1.vm.hostname = "c1"
    c1.vm.network "private_network", type: "dhcp", virtualbox__intnet: "ddns-net"
    c1.vm.provision "shell", path: "config-client/provision-client.sh"
  end
end