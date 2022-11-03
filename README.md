# cherrypt-test

# Docker steps
```sh
sh build.sh
sh run.sh
curl localhost:8282
curl localhost:8181
sh stop.sh
```

# k8s steps
```
sudo kubectl apply -f cherrypy-test-deployment.yaml
sudo kubectl get services
sudo kubectl get deployment
curl 10.43.3.70:8080
```
