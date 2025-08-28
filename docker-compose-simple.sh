# version must be >= 1.8.8
export VERSION=1.8.10
export EXPOSE_PORT=80
CMD="${1:-up -d}"
if command -v docker-compose > /dev/null ; then
    docker-compose --file ./docker-compose-simple.yml  --project-name snb $CMD
elif docker compose version > /dev/null ; then
    docker compose --file ./docker-compose-simple.yml  --project-name snb $CMD
else
    echo "错误: 未找到 docker-compose 或 docker compose，请先安装 Docker 及 Compose."
    exit 1
fi