REM 检查参数
if "%~1"=="install" (
    call :install
    exit /b
)

REM 启动 snb_linux ，启动成功后进入linux shell 界面
REM 稍后几秒后，浏览器打开：http://127.0.0.1/  即可访问使用：SmartNotebook 
REM 初始用户名： snb-demo@smartnotebook.tech  初始密码：123456
REM 开启您的数据分析愉快之旅
REM 如果提示“不存在具有所提供名称的分发。”，请执行安装命令：win_start_snb.cmd install
wsl.exe -d snb_linux --user root
exit /b

:install
curl -o wsl.exe https://gitee.com/smartnotebook/snb-docker-compose/raw/main/publish/wsl.exe
REM 检查 WSL 状态
wsl.exe --status

REM 更新 WSL
wsl.exe --update

REM 安装 Ubuntu-24.04 发行版，并指定安装路径为当前目录
curl -o ubuntu-24.04.2-wsl-amd64.wsl https://releases.ubuntu.com/noble/ubuntu-24.04.2-wsl-amd64.wsl
wsl.exe --install --name snb_linux --location %cd% --from-file ubuntu-24.04.2-wsl-amd64.wsl

REM 列出已安装的linux
wsl.exe --list

REM 在 snb_linux 中安装 Docker（通过 Snap）
wsl.exe -d snb_linux --user root snap install docker

REM 配置 Git 全局用户名和邮箱
wsl.exe -d snb_linux --user root git config --global user.name "smartnotebook"
wsl.exe -d snb_linux --user root git config --global user.email "15492003+smartnotebook@user.noreply.gitee.com"

REM 克隆 Git 仓库
wsl.exe -d snb_linux --user root git clone https://gitee.com/smartnotebook/snb-docker-compose.git

cd snb-docker-compose

REM 进入克隆的仓库目录并执行部署脚本
wsl.exe -d snb_linux --user root export PATH=$PATH:/snap/bin ;sleep 2; sh deploy-simple.sh

cd ..

REM 安装成功，进入 snb_linux linux,设置linux 默认用户名和密码
REM 然后exit退出linux，重新执行 win_start_snb.cmd
wsl.exe -d snb_linux --user root
