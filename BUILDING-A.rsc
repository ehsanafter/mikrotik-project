# feb/18/2022 18:24:33 by RouterOS 7.1.1
# software id = TI09-7WK3
#
/interface bridge
add name=lo
/interface lte apn
set [ find default=yes ] ip-type=ipv4
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/lora servers
add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU \
    up-port=1700
add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US \
    up-port=1700
add address=eu1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (eu1)" up-port=1700
add address=nam1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (nam1)" up-port=1700
add address=au1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (au1)" up-port=1700
add address=eu1.cloud.thethings.network down-port=1700 name="TTN V3 (eu1)" \
    up-port=1700
add address=nam1.cloud.thethings.network down-port=1700 name="TTN V3 (nam1)" \
    up-port=1700
add address=au1.cloud.thethings.network down-port=1700 name="TTN V3 (au1)" \
    up-port=1700
/port
set 0 name=serial0
set 1 name=serial1
/interface vrrp
add group-master=vrrp-master interface=ether1 name=vrrp-master priority=200 \
    vrid=200
/interface vlan
add interface=vrrp-master name=vlan1 vlan-id=1001
/interface bridge settings
set use-ip-firewall=yes
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/ip address
add address=172.16.1.101/26 interface=ether1 network=172.16.1.64
add address=10.20.1.1/8 interface=vrrp-master network=10.0.0.0
add address=5.5.5.5 interface=lo network=5.5.5.5
/ip cloud
set update-time=no
/ip traffic-flow
set enabled=yes
/ip traffic-flow target
add dst-address=172.16.1.110
/mpls interface
add disabled=no interface=ether1
/mpls ldp
add disabled=no lsr-id=5.5.5.5 transport-addresses=5.5.5.5
/mpls ldp interface
add disabled=no interface=ether1 transport-addresses=5.5.5.5
/system identity
set name=BUILDING-A
