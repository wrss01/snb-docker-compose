export VERSION=1.8.10
export EXPOSE_PORT=80

mkdir data_minio
mkdir data_mysql
mkdir data_node
mkdir data_server
chmod 777 data_minio

chmod +x wait-for-it.sh 

docker-compose --file ./docker-compose.yml  --project-name snb up -d