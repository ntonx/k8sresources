#! /bin/sh

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=2379-2380/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10251/tcp
firewall-cmd --permanent --add-port=10252/tcp
firewall-cmd --permanent --add-port=10255/tcp
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
kubeadm init
#mkdir -p $HOME/.kube
#cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#chown $(id -u):$(id -g) $HOME/.kube/config
#export KUBECONFIG=$HOME/.kube/config
#kubectl get nodes
