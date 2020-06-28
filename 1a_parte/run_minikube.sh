minikube start --cpus 2 --memory 4096

NS_METRICAS=default
NAME=kube-state-metrics
POD=`kubectl get pods -n $NS_METRICAS | grep $NAME | awk '{ print $1 }'`
kubectl port-forward $POD 8080:8080 -n $NS_METRICAS &

NS_METRICAS=default
NAME=cadvisor
POD=`kubectl get pods -n $NS_METRICAS | grep $NAME | awk '{ print $1 }'`
kubectl port-forward $POD 8081:8080 -n $NS_METRICAS &

