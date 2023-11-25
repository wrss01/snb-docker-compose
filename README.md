# snb-docker-compose
smartnotebook docker-compose 部署脚本

-  本部署脚本生成的服务仅支持SmartNotebook 基本功能，如需扩展功能请与我们联系！
-  Linux、Mac 、windows 10 部署测试通过，软件上在mac、windows有小兼容问题，不影响使用。

## docker and docker-compose 版本：测试环境的参考版本
- docker Version: 18.06.1-ce
- Docker Compose version: v2.23.0

## git clone 脚本
```shell
git clone https://github.com/wrss01/snb-docker-compose.git
```

## 创建本地持久化存储路径
```
cd snb-docker-compose/
sh pre_up.sh
```

## 修改 wait-for-it.sh 执行权限
```shell
cd snb-docker-compose/
chmod +x wait-for-it.sh 
```

## 创建和启动容器组(Create and start containers)
Mac 环境下需要手工pull mysql 镜像，
```
docker pull --platform linux/x86_64 mysql:5.7
```

```shell
docker-compose --project-name snb up
```

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/8d1fa962-fdcf-4b8f-8eea-65cb40887d85)

## 访问smartnotebook:
http://ip/

比如：http://47.116.50.172/

##### 登录页如下：

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/6a7cb7e0-593c-4071-b7f6-4e945d26b8f9)

##### 默认用户名和密码：

- 默认用户名：snb-demo@smartnotebook.tech
- 默认密码：123456

##### 登录成功后的首页：

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/e3c35e3c-10c5-4447-a0b0-59f78f47db63)

## 创建第一notebook：

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/8dda2eaa-77a6-4ed7-99d8-81537af834bd)

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/bec3d224-dc31-4b8e-9ef4-0b30a708151c)

##### 编写第一行python 代码并运行

```python
print("Welcome to the world of SmartNoteBook \n"*15)
```

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/fc4d4830-833d-434b-bb46-d5d815b52b86)

## 问题反馈和交流
##### 新语数据故事会
![qrcode_for_gh_dba8fcd77b28_344 (1)](https://github.com/wrss01/snb-docker-compose/assets/39665821/6c684741-2ec3-4247-96d0-6ba515de203d)

##### 微信联系

![image](https://github.com/wrss01/snb-docker-compose/assets/39665821/f05b8409-6543-4c4b-82ff-98358a601914)


##### Email联系
wangxinyi@smartnotebook.tech
