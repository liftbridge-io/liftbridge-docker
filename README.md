# liftbridge-docker
[![GitHub](https://img.shields.io/github/license/dgzlopes/liftbridge-docker)](https://github.com/dgzlopes/liftbridge-docker/blob/master/LICENSE)
> **WARNING**: This container is intended for testing and/or development purposes!

Liftbridge provides lightweight, fault-tolerant message streams by implementing a durable stream augmentation for the NATS messaging system. 

This is the Git repo of the Docker image embedding [NATS](https://https://nats.io/) next to [Liftbridge](https://github.com/liftbridge-io/liftbridge). 


## Usage
Using the container can be done like this:
```
$ docker pull dgzlopes/liftbridge-docker:v0.0.1
$ docker run -d --name=liftbridge-main -p 4222:4222 -p 9292:9292 -p 8222:8222 dgzlopes/liftbridge-docker:v0.0.1
```

This will bootup the container and start both the NATS and Liftbridge servers. We can check the logs to see if the container booted properly:

```
$ docker logs liftbridge-main
[6] 2019/08/21 11:26:09.366043 [INF] Starting nats-server version 2.0.4
[6] 2019/08/21 11:26:09.366094 [INF] Git commit [not set]
[6] 2019/08/21 11:26:09.366274 [INF] Starting http monitor on 0.0.0.0:8222
[6] 2019/08/21 11:26:09.366333 [INF] Listening for client connections on 0.0.0.0:4222
[6] 2019/08/21 11:26:09.366354 [INF] Server id is NAI5VLHK3IWC5ENOS3HARMNGZTWNRLXQCYPHTKNXXCGW5EJWR4JXCNVZ
[6] 2019/08/21 11:26:09.366358 [INF] Server is ready
[6] 2019/08/21 11:26:09.366761 [INF] Listening for route connections on 0.0.0.0:6222
time="2019-08-21 11:26:14" level=info msg="Server ID:        MSQaSobS9afF1aN4E8oTIJ"
time="2019-08-21 11:26:14" level=info msg="Namespace:        liftbridge-default"
time="2019-08-21 11:26:14" level=info msg="Retention Policy: [Age: 1 week, Compact: false]"
time="2019-08-21 11:26:14" level=info msg="Starting server on :9292..."
time="2019-08-21 11:26:15" level=info msg="Server became metadata leader, performing leader promotion actions"
```

### Volume
Optionally you can specify the mount point with: 

```--volume=/tmp/host/liftbridge:/tmp/liftbridge/liftbridge-default  ```

### Ports
Liftbridge server exposes:
- 9292 for clients.

NATS server exposes:
- 4222 for clients.
- 8222 as an HTTP management port for information reporting.

### Default NATS Configuration file

```
# Client port of 4222 on all interfaces
port: 4222

# HTTP monitoring port
monitor_port: 8222
```

