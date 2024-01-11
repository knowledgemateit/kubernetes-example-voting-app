#!/bin/bash
apt update -y
apt upgrade -y
apt install apt-transport-https docker.io -y

systemctl start docker 
systemctl enable docker

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
   
apt update -y

apt install -y kubelet kubeadm  kubectl
  
systemctl daemon-reload 
systemctl start kubelet 
systemctl enable kubelet.service
