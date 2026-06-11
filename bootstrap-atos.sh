apt-get update
apt-get install bind9 bind9-dnsutils -y
sudo hostnamectl set-hostname atos.izanramos.test
echo "192.168.56.10 atos.izanramos.test atos" | sudo tee -a /etc/hosts >/dev/null
cp /vagrant/conf/named.conf.local /etc/bind/named.conf.local
cp /vagrant/conf/named.conf.options /etc/bind/named.conf.options
cp /vagrant/conf/db.izanramos.test /etc/bind/db.izanramos.test
cp /vagrant/conf/db.192.168.56 /etc/bind/db.192.168.56
sudo systemctl restart bind9