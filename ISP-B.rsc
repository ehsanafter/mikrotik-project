# feb/18/2022 18:18:15 by RouterOS 7.1.1
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
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/ip address
add address=172.16.2.2 interface=lo network=172.16.2.2
add address=10.0.0.2/30 interface=ether1 network=10.0.0.0
/ip cloud
set update-time=no
/ip firewall address-list
add address=192.168.20.0/24 list=bgp_advertise
/routing bgp connection
add address-families=ip as=200 connect=yes disabled=no listen=yes local.role=\
    ebgp name=Peer100 output.network=bgp_advertise remote.address=10.0.0.1/32 \
    .as=100 router-id=172.16.2.2 routing-table=main
/system identity
set name=ISP-B
