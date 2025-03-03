
function Install-Snb {
    try {
        Write-Host "检查 WSL 版本"

        $wsl_version = wsl.exe --version
        $wsl_version = $wsl_version -replace "[^\x20-\x7E]", ""
        if ( -Not ($wsl_version -match "2.4.11.0") )
        {
            
            Write-Host "wsl 版本太低:$wsl_version,下载wsl 最新版本安装"
            Write-Host "自动下载，下载后安装 wsl.2.4.11.0.x64.msi  https://github.com/microsoft/WSL/releases/download/2.4.11/wsl.2.4.11.0.x64.msi"
            #Invoke-WebRequest -Uri "https://github.com/microsoft/WSL/releases/download/2.4.11/wsl.2.4.11.0.x64.msi" -OutFile wsl.2.4.11.0.x64.msi
            Write-Host "安装 wsl.2.4.11.0.x64.msi"
            Write-Host "安装相关组件:  wsl --install "
           # exit 1
        }
        
        $wslList = wsl.exe --list --quiet
        if ($wslList -contains "snb_linux") {
            Write-Host "snb_linux 已经安装，跳过安装步骤。"
        } else  {
            $wslFile = "ubuntu-24.04.2-wsl-amd64.wsl"
            if ( -Not ( Test-Path $wslFile ) ) {
                Write-Host "下载 Ubuntu-24.04 WSL 镜像..."
                Invoke-WebRequest -Uri "https://releases.ubuntu.com/noble/ubuntu-24.04.2-wsl-amd64.wsl" -OutFile $wslFile
            }

            Write-Host "安装 snb_linux..."
            wsl.exe --install --name snb_linux --location $PWD --from-file $wslFile
        }

        wsl.exe --list

        Write-Host "在 snb_linux 中安装 Docker..."
        wsl.exe -d snb_linux --user root snap install docker
        
        Write-Host "配置 Git 全局用户名和邮箱..."
        wsl.exe -d snb_linux --user root git config --global user.name "smartnotebook"
        wsl.exe -d snb_linux --user root git config --global user.email "15492003+smartnotebook@user.noreply.gitee.com"
        
        Write-Host "克隆 Git 仓库..."
        wsl.exe -d snb_linux --user root git clone https://gitee.com/smartnotebook/snb-docker-compose.git

        Write-Host "进入克隆的仓库目录并执行部署脚本..."
        wsl.exe -d snb_linux --user root export PATH=`$PATH:/snap/bin `; sleep 2 `; cd snb-docker-compose `; sh deploy-simple.sh

        wsl.exe -d snb_linux --user root bash -c "$command"

        Write-Host "安装成功，进入 snb_linux linux,设置 Linux 默认用户名和密码"
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

