## task

```
Research https://agones.dev/site/. Deploy agones locally (minikube or docker desktop, kubernetes) or in any cloud. AWS is a big plus. Use https://github.com/googleforgames/agones/tree/main/examples/xonotic as dedicated server. Xonotic client should be able to join a dedicated server. Matchmaker or any other automatic fleet management is not required. Fleet could be managed manually with agones rest api. Provide documentation with steps how to reproduce the environment and test the game
```

## solution
install Agones:
```
helm repo add agones https://agones.dev/chart/stable
helm repo update
helm install my-agones --namespace agones-system --create-namespace agones/agones
```

install the game server and fleet and allocation:
```
kubectl create -f https://raw.githubusercontent.com/googleforgames/agones/main/examples/xonotic/gameserver.yaml
kubectl create -f https://raw.githubusercontent.com/googleforgames/agones/main/examples/xonotic/fleet.yaml
kubectl create -f https://raw.githubusercontent.com/googleforgames/agones/main/examples/xonotic/gameserverallocation.yaml

```

check the servers:
```
kubectl get gs
```

in the list presented by the command above we should see one with `Allocated` status.
This means we have successfully allocated a GameServer out of the fleet, and can now connect your players to it.

Use its IP and port in the client's configuration to connect the server.