
Building the docker image...
```
docker build --force-rm=true -t query-engine-comparison .
```

Running it...
```
docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 80:80 -p 4040:4040 -p 7180:7180 -p 8888:8888 -p 10000:10000 --name quickstart query-engine-comparison
```
