# 使用smartnotebook/snb-all镜像部署

##  启动服务
1. 安装Docker
2. 简单启动snb服务
    ```bash
    docker run -d -p 80:80 --name snbServies smartnotebook/snb-all:1.0.0
    ```
3. 通过IP访问

> **Tips：**
> 
> **重启服务会导致数据库和对象存储数据丢失，建议挂载SNB数据文件到服务器**
> 1. **Minio存储路径：/usr/local/src/minio/data**  
> 2. **MySQL存储路径：/usr/local/src/mysql/data**
