## task

```
1. create Dockerfile for this application
2. create docker-compose.yaml to replicate a full running environment
so that a developer can run the entire application locally without having
to run any dependencies (i.e. redis) in a separate process.
3. explain how you would monitor this application in production. please
write code/scripts to do the monitoring.
```

## solution

- `Dockerfile` is in this folder;
- To start the **app** and **redis** run `docker compose up`;
- Open a browser at http://127.0.0.1:8080 to see the result;
- possible options for monitoring such app would be solutions that check whether the response code is within the specific range:
- - Zabbix/Prometheus or other 3rd party apps that do the same;
- - some SaaS services that check availability of endpoints specified;
- - a [script](check.sh) that endlesly does `curl` comparing the HTTP response code and sending email/slack message in case of a failure;

### script usage

```
./check.sh http://127.0.0.1:8080
```