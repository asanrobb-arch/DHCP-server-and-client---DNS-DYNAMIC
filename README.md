# Práctica de Servidor DHCP con DNS Dinámico (DDNS)

## El Proyecto

Este proyecto levanta automáticamente un entorno de red virtual que demuestra el funcionamiento del DNS Dinámico (DDNS).

El escenario consiste en un servidor DHCP que, además de asignar direcciones IP a los clientes, notifica de forma automática a un servidor DNS para que registre o actualice el nombre de host del cliente con su nueva IP. Esto permite que los nombres de los equipos en la red siempre se resuelvan a su dirección IP actual, incluso en un entorno dinámico.

Todo el proceso está automatizado con Vagrant.

## Arquitectura del Entorno

El entorno está compuesto por tres máquinas virtuales interconectadas:

*   **dns**: Un servidor DNS (BIND9) que recibe las actualizaciones dinámicas.
*   **dhcp**: Un servidor DHCP (ISC-DHCP-Server) que asigna IPs y notifica al servidor DNS.
*   **c1**: Una máquina cliente que obtiene toda su configuración de red de forma automática.

## Requisitos

*   Vagrant
*   VirtualBox
