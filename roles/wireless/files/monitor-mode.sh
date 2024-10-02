sudo nmcli device set $1 managed no
sudo ip link set $1 down
sudo iw dev $1 set type monitor
sudo ip link set $1 up