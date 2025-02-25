# version must be >= 1.8.8
export VERSION=1.8.9
export EXPOSE_PORT=80

docker-compose --file ./docker-compose-simple.yml  --project-name snb up -d
