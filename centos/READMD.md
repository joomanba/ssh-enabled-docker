# SSH-ENABLED-CentOS Docker Image

## Execute '/usr/sbin/init' 

If '/usr/sbin/init' is not executed in docker run, the following error occurs:

```
# systemctl 
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down
```

The issue can be solved as shown below
1. Dockerfile

```
FROM centos:latest
...

ENTRYPOINT ["/usr/sbin/init"]
```

2. docker run

```
docker run -d --name centos01 --privileged -it joomanba/ssh-enabled-centos:0.1
```

## Issues

1. If you do not include shebang in the script

```
standard_init_linux.go:219: exec user process caused: exec format error
```