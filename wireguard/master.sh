#!/bin/bash

sudo swapoff -a

sudo kubeadm init \
  --control-plane-endpoint 192.168.2.10 \
  --node-name=control \
  --pod-network-cidr 10.48.0.0/16 \
  --service-cidr 10.49.0.0/16 > /vagrant_data/output

mkdir -p /home/vagrant/.kube
mkdir -p /root/.kube
sudo cp -f /etc/kubernetes/admin.conf /root/.kube/config
sudo cp -f /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo cp -f /etc/kubernetes/admin.conf /vagrant_data/kube_config
sudo chown \$(id vagrant -u):\$(id vagrant -g) /home/vagrant/.kube/config

kubectl apply -f /vagrant_data/manifests/calico-3.14.yaml

curl -O -L  https://github.com/projectcalico/calicoctl/releases/download/v3.14.0/calicoctl
chmod +x calicoctl
sudo cp calicoctl /usr/local/bin/calicoctl

