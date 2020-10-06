#Building

docker build --no-cache -t exakat/exakat-enterprise:latest .
say build docker 

docker push exakat/exakat-enterprise:latest

# Exemple avec sculpin
docker run --rm -it -w=/usr/src/exakat -v /Users/famille/Desktop/docker/projects/sculpin/code:/app exakat/exakat-ga:latest

# interactive access
docker run --rm -it -e INPUT_FORMAT='sarif' -e INPUT_PROJECT_TOKEN='aabaa' -e GITHUB_REPOSITORY='dseguy/sculpin' --entrypoint /bin/bash exakat/exakat-enterprise:latest
