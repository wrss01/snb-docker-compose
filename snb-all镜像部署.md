# 使用smartnotebook/snb-all镜像部署

##  启动服务
1. 安装Docker
2. 简单启动snb服务
    ```bash
    docker run -d -p 80:80 --name snbServies smartnotebook/snb-all:1.0.0
    ```
3. 复制镜像数据
4. 通过IP访问
5. 用户名密码
   - 用户名: snb-demo@smartnotebook.tech
   - 密码: 123456

##### 登录成功后的首页：

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/e3c35e3c-10c5-4447-a0b0-59f78f47db63)

> **进入计算环境，重新挂载node，修改node的域名或者IP**
    ![image](https://github.com/wrss01/snb-docker-compose/assets/93983997/fe61e3f4-9415-447c-897e-f5ffa89a0dc3)


## 创建第一notebook：

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/8dda2eaa-77a6-4ed7-99d8-81537af834bd)

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/bec3d224-dc31-4b8e-9ef4-0b30a708151c)

##### 编写第一行python 代码并运行

```python
print("Welcome to the world of SmartNoteBook \n"*15)
```

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/fc4d4830-833d-434b-bb46-d5d815b52b86)

> **Tips：**
> 
> **重启服务会导致数据库和对象存储数据丢失，建议挂载SNB数据文件到服务器，重启服务前对数据文件进行迁移和备份**
> 1. **Minio存储路径：/usr/local/src/minio/data**  
> 2. **MySQL存储路径：/usr/local/src/mysql/data**
