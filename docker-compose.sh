export VERSION=1.8.10
export EXPOSE_PORT=80

mkdir data_minio
mkdir data_mysql
chmod 777 data_minio

chmod +x wait-for-it.sh 

CMD="${1:-up -d}"

if command -v docker-compose &> /dev/null; then
    docker-compose --file ./docker-compose.yml  --project-name snb $CMD
elif docker compose version &> /dev/null; then
    docker compose --file ./docker-compose.yml  --project-name snb $CMD
else
    echo "错误: 未找到 docker-compose 或 docker compose，请先安装 Docker 及 Compose."
    exit 1
fi
