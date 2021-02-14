#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get install -y net-tools
sudo apt-get install -y emacs
sudo ln -sf /usr/bin/emacs /usr/bin/e

sudo apt-get install -y wget
sudo apt-get install -y unzip

sudo wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

mkdir -p /home/ubuntu/.aws
cat <<EOT > /home/ubuntu/.aws/config
[default]
region = us-east-1
output = text
EOT

echo "export PATH=$PATH:/usr/local/go/bin"  >> /home/ubuntu/.profile