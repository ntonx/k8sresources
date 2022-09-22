## k8sresources

Declarative yaml files to deploy two apps in a k8s cluster

This repo contains two directories:

1) install/

        Contains sh files to execute on a cluster and install kubernetes environment
2) demo/

        Contains yaml files to execute two complete demos systems
        
                + guestbook/ 
                        
                        This directory has yaml files to deploy a system based on php UI and two DB Redis services 
                        (one leader and other a follower)
                
                * allinone.yaml 
                        
                        This file is a declarative file to deploy a system based on four microservices coded in JS, 
                        Ruby, Java and Python programming languages
