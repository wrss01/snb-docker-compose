# version must be >= 1.8.8
export VERSION=1.8.10
export EXPOSE_PORT=80
CMD="${1:-up -d}"
docker-compose --file ./docker-compose-simple.yml  --project-name snb $CMD
