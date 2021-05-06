#!/bin/bash
#After checking the firewall status and the netstatus for the ports
#Nik Cortez and Alessandro Cook found the ports weren't listening
#Turning off the firewall did not work
#Drew Cochran found this fix to turn on the TUN/TAP virtual network adapters
#Use this solution if OPENVPN is connecting but not allowing pings to the server

# Allow TUN interface connections to OpenVPN server
iptables -A INPUT -i tun+ -j ACCEPT

# Allow TUN interface connections to be forwarded through other interfaces
iptables -A FORWARD -i tun+ -j ACCEPT

# Allow TAP interface connections to OpenVPN server
iptables -A INPUT -i tap+ -j ACCEPT

# Allow TAP interface connections to be forwarded through other interfaces
iptables -A FORWARD -i tap+ -j ACCEPT