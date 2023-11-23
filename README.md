# docker-php-with-imagick

PHP 7.4 with imagick for specific purposes

## Building locally

### Setup docker buildx (run once)

```bash
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --use
```

### Build the image

```bash
docker buildx build --platform linux/amd64,linux/arm64 .
```

Example builds for both amd64 and arm64
