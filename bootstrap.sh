apt-get update 
apt-get install vsftpd -y
if !id -u izanramos >/dev/null 2>&1; then
    sudo useradd -m izanramos 
    echo "izanramos:1234" | chpasswd
fi
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
cp /vagrant/conf/vsftpd.conf /etc/vsftpd.conf
sudo systemctl restart vsftpd