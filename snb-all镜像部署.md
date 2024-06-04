# 使用smartnotebook/snb-all镜像部署

##  启动服务
1. 安装Docker
2. 启动snb服务
    ```bash
    docker run -d -p 80:80 --name test-images smartnotebook/snb-all:1.0.0
    ```
3. 通过IP访问