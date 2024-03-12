## task

```
4. prepare local Kubernetes environment (using MiniKube + Helm) to run our application in pod/container.
it should be created a helm chart with resources for deploying application to Kuberenetes. 
store all relevant scripts (kubectl commands etc) in your forked repository.
5. suggest & create minimal local infrastructure to perform functional testing/monitoring of our application pod.
demonstrate monitoring of relevant results & metrics for normal app behavior and failure(s).
```

## solution

build the app:
```
docker build -t web-app:v1 ../task-1
```

install and start Minikube:
```
brew install minikube
minikube start
```

to install our app into Minikube using the Helm chart:
```
minikube image load web-app:v1
helm upgrade --install web-app app
```

---

For monitoring and alerting based on metrics we should use Prometheus stack configured with the blackbox exporter with `prober: http`.