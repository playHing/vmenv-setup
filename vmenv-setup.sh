## sudo mode
sudo -s
## config swap space
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=8192
/sbin/mkswap /var/swap.1
chmod 600 /var/swap.1
/sbin/swapon /var/swap.1
echo "/var/swap.1   swap    swap    defaults        0   0" >> /etc/fstab
free -h
# exit sudo mode
exit

## install go
curl -O https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
tar -xvf go1.14.4.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local
rm go1.14.4.linux-amd64.tar.gz
echo "" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
source ~/.profile
go version

## get k8s code
mkdir -p $GOPATH/src/k8s.io
cd $GOPATH/src/k8s.io
git clone https://github.com/playHing/kubernetes
cd kubernetes