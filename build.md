## Build / Push (Internal Use)
> _Building from MacOS_

This is only necessary the first time building on a machine ([source](https://unix.stackexchange.com/a/748634)):
```sh
docker buildx create --use \
  --platform=linux/amd64,linux/arm64/v8,linux/arm64,linux/arm/v7 \
  --name multi-platform-builder

docker buildx inspect --bootstrap
```

Authenticate to Dockerhub:
```sh
docker login -u djhouseknecht
# then enter personal access token as password
```


Building versions/tags and pushing to dockerhub:
```sh
export TAG="latest"

docker buildx build \
  --platform=linux/amd64,linux/arm64/v8,linux/arm64,linux/arm/v7 \
  -f=Dockerfile \
  -t=djhouseknecht/tinyproxy:$TAG \
  --push \
  .
```
