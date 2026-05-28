apt-get update
apt-get install bind9 bind9-dnsutils -y
sudo hostnamectl set-hostname atos.izanramos.test
echo "192.168.56.10 atos.izanramos.test atos" | sudo tee -a /etc/hosts >/dev/null
cp /vagrant/conf/named.conf.local /etc/bind/named.conf.local
cp /vagrant/conf/named.conf.options /etc/bind/named.conf.options
cp /vagrant/conf/db.izanramos.test /etc/bind/db.izanramos.test
cp /vagrant/conf/db.192.168.56 /etc/bind/db.192.168.56
sudo systemctl restart bind9

apt-get update 
apt-get install vsftpd -y
if !id -u izanramos >/dev/null 2>&1; then
    sudo useradd -m izanramos 
    echo "izanramos:1234" | chpasswd
fi
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
cp /vagrant/conf/vsftpd.conf /etc/vsftpd.conf
sudo systemctl restart vsftpd