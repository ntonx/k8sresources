#! /bin/sh

setenforce 0
swapoff -a
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=6783/tcp
firewall-cmd --add-port=8472/udp --permanent
firewall-cmd --add-port=8090/tcp --permanent
systemctl restart firewalld
firewall-cmd --reload
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
systemctl daemon-reload
systemctl restart docker
systemctl restart kubelet
systemctl enable kubelet
systemctl start kubelet
systemctl enable docker
systemctl start docker
kubeadm join <IP_MASTER_NODE>:6443 --token <TOKEN>