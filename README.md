# cherrypt-test

# Docker steps
```sh
sh build.sh
sh run.sh
curl localhost:8282
curl localhost:8181
sh stop.sh
```

# k8s/k3s steps
```sh
kubectl create deployment cherrypy-test --image=vbodocker/cherrypy-test
kubectl expose deployment cherrypy-test --port=8000 \
  --target-port=8080 --type=ClusterIP
curl $(kubectl get services | grep cherry | awk '//{print $3}'):8000
```

# Push image to docker hub
```sh
docker build -t vbodocker/cherrypy-test . 
docker run -p 8080:8080 vbodocker/cherrypy-test 
docker login # user vbodocker
docker push vbodocker/cherrypy-test 
docker pull vbodocker/cherrypy-test:latest
```

# Rollout new image
```sh
kubectl rollout status deployment/cherrypy-test
kubectl set image deployment/cherrypy-test \
  cherrypy-test=vbodocker/cherrypy-test:latest
kubectl get deployments
kubectl exec -it cherrypy-test-57cdf5bfdd-bxnbs -- cat /etc/os-release
```
