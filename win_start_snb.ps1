
function Install-Snb {
    try {
        Write-Host "导入 snb_linux_1.8.10.tar.gz"

        wsl --import snb_linux  $PWD snb_linux_1.8.10.tar.gz
        
        Write-Host "克隆 Git 仓库..."
        wsl.exe -d snb_linux --user root git clone https://gitee.com/smartnotebook/snb-docker-compose.git

        Write-Host "进入克隆的仓库目录并执行部署脚本..."
        wsl.exe -d snb_linux --user root export PATH=`$PATH:/snap/bin `; sleep 2 `; cd snb-docker-compose `; sh docker-compose-simple.sh

        Write-Host "部署成功"
        Write-Host "然后 exit 退出 Linux，重新执行 win_start_snb.ps1"
        wsl.exe -d snb_linux --user root
    } catch {
        Write-Host "发生错误: $_"
        exit 1
    }
}


if ($args[0] -eq "install") {
    Install-Snb
    exit
}

Write-Host "启动 snb_linux，启动成功后进入 Linux shell 界面"
Write-Host "稍后几秒后，浏览器打开：http://127.0.0.1/  即可访问使用：SmartNotebook "
Write-Host "初始用户名： snb-demo@smartnotebook.tech  初始密码：123456"
Write-Host "开启您的数据分析愉快之旅"
Write-Host "如果提示 不存在具有所提供名称的分发  请执行安装命令：win_start_snb.ps1 install"
wsl.exe -d snb_linux --user root
exit

