# Ubuntu 16.04 x64
apt-get install -y python-pip
pip install setuptools
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh
sudo ssserver -p 20801 -k tokyo-hpV191 -m aes-256-cfb --user nobody -d start
