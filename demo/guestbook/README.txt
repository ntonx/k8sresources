
########################################################################
#####################           CREATE K8s OBJECTS      ###########################
########################################################################

kubectl apply -f https://k8s.io/examples/application/guestbook/redis-leader-deployment.yaml
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-leader-service.yaml
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-follower-deployment.yaml
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-follower-service.yaml
kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
*kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-service.yaml

###EDIT FRONTEND SERVICE WITH THIS COMMAND### OR EXPOSE FRONTEND DEPLOYMENT FROM CONSOLE AS NodePort

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: guestbook
    tier: frontend
EOF

* Access to Frontend using 80 as port, or port describe in "kubectl get svc" results
* Access to redisleader pod  (kubectl exec -it pod/idpod -- bash) and execute 
	redis-cli
* then execute=
	keys *
	get guestbook
	set guestbook "write"
* refresh frontend page 
* you can access redisfollower to see data is replicating on those pods 

########################################################################
#####################           DELETE K8s OBJECTS      ###########################
########################################################################

kubectl delete -f https://k8s.io/examples/application/guestbook/redis-leader-deployment.yaml
kubectl delete -f https://k8s.io/examples/application/guestbook/redis-leader-service.yaml
kubectl delete -f https://k8s.io/examples/application/guestbook/redis-follower-deployment.yaml
kubectl delete -f https://k8s.io/examples/application/guestbook/redis-follower-service.yaml
kubectl delete -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
kubectl delete -f https://k8s.io/examples/application/guestbook/frontend-service.yaml