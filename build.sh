#Building

docker build --no-cache -t exakat/exakat-enterprise:latest .
say build docker 

docker push exakat/exakat-enterprise:latest

# Exemple avec sculpin
docker run --rm -it -w=/usr/src/exakat -v /Users/famille/Desktop/docker/projects/sculpin/code:/app exakat/exakat-ga:latest

# interactive access
docker run --rm -it -e INPUT_FORMAT='sarif' -e INPUT_PROJECT_TOKEN='aaaaa' --entrypoint /bin/bash exakat/exakat-enterprise:latest
docker run --rm -it  -e INPUT_IGNORE_DIRS='/' -e INPUT_IGNORE_RULES='Php/ShouldUseCoalesce,Functions/UsesDefaultArguments' -v /Users/famille/Desktop/docker/projects/sculpin/code:/github/workspace --entrypoint /bin/bash exakat/exakat-ga:latest
docker run --rm -it -e INPUT_PROJECT_REPORTS='Sarif' -e INPUT_IGNORE_RULES='Php/ShouldUseCoalesce,Functions/UsesDefaultArguments' -v /Users/famille/Desktop/docker/projects/sculpin/code:/github/workspace --entrypoint /bin/bash exakat/exakat-ga:latest
