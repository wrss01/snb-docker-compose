- 目录
  - snb-docker-compose部署
    1. 参考版本
    2. git clone脚本
    3. docker-compose 方式部署
    4. windows WSL 方式部署
  - 测试
    1. 访问 smartnotebook
    2. 创建第一个notebook
  - 问题反馈和交流

----

# snb-docker-compose
smartnotebook docker-compose 部署脚本

-  本部署脚本生成的服务仅支持SmartNotebook 全部功能，如需定制功能或技术支持请与我们联系！

## docker and docker-compose 版本：测试环境的参考版本
- docker Version: 18.06.1-ce
- Docker Compose version: v2.23.0

## git clone 脚本

### github.com

```shell
git clone https://github.com/wrss01/snb-docker-compose.git
```

### gitee.com

```shell
git config --global user.name "smartnotebook"
git config --global user.email "15492003+smartnotebook@user.noreply.gitee.com"
git clone https://gitee.com/smartnotebook/snb-docker-compose.git
```
## docker-compose 方式部署

### simple 简化部署(Create and start containers)
中间件(数据库、minio、redis)内置方式，只需要两个容器。如需要修改端口，请修改docker-compose-simple.sh 文件。
```shell
cd snb-docker-compose
sh docker-compose-simple.sh
```

### 全部件部署(Create and start containers)
中间件使用mysql、minio、redis，全部需要五个容器。如需要修改端口，请修改docker-compose.sh 文件。
```shell
cd snb-docker-compose
sh docker-compose.sh
```

## windows WSL 方式部署

1. 下载部署程序和WSL 文件检查

请先确认您的 WSL 版本是否满足要求，若版本过低，您可以通过百度网盘下载最新版 WSL 安装包进行升级；下载地址链接: https://pan.baidu.com/s/1cRKVnvAVqbxLl27kvxMD2w?pwd=9ypk  提取码: 9ypk 。
    温馨提示：在部署之前，请确保您的 CPU 已开启 VT（虚拟化技术）指令，以支持虚拟化环境的正常运行。
• 下载网盘上三个文件，包括部署脚本（win_start_snb.ps1）、虚拟机文件(snb_linux_1.8.10.tar.gz)、wsl 安装文件(wsl.2.4.11.0.x64.msi)。
• 确认WSL 版本和 Windows 启用 VT（虚拟化技术），如果版本比较低，请安装wsl.2.4.11.0.x64.msi ,安装完成后，执行 wsl --install 安装wsl组件。 
• 确保有足够的空间，然后在指定文件夹下打开 power shell，执行以下命令下载安装脚本进行安装

2. 安装部署

参考wsl power shell 脚本win_start_snb.ps1，接下来执行安装命令，进行部署：

```shell
win_start_snb.ps1 install
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
