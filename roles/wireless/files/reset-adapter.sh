sudo nmcli device set $1 managed yes
sudo ip link set $1 down
sudo iw dev $1 set type managed
sudo ip link set $1 up