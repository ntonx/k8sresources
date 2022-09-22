#! /bin/sh

#kubectl drain <NodeName> --ignore-daemonsets --delete-local-data
#kubectl delete node <NodeName>
kubectl drain <NodeName> --ignore-daemonsets --delete-local-data
kubectl delete node <NodeName>
