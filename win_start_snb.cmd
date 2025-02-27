REM ������
if "%~1"=="install" (
    call :install
    exit /b
)

REM ���� snb_linux �������ɹ������linux shell ����
REM �Ժ����������򿪣�http://127.0.0.1/  ���ɷ���ʹ�ã�SmartNotebook 
REM ��ʼ�û����� snb-demo@smartnotebook.tech  ��ʼ���룺123456
REM �����������ݷ������֮��
REM �����ʾ�������ھ������ṩ���Ƶķַ���������ִ�а�װ���win_start_snb.cmd install
wsl -d snb_linux --user root
exit /b

:install

REM ��� WSL ״̬
wsl --status

REM ���� WSL
wsl --update

REM ��װ Ubuntu-24.04 ���а棬��ָ����װ·��Ϊ��ǰĿ¼
curl -o ubuntu-24.04.2-wsl-amd64.wsl https://releases.ubuntu.com/noble/ubuntu-24.04.2-wsl-amd64.wsl
wsl --install --name snb_linux --location %cd% --from-file ubuntu-24.04.2-wsl-amd64.wsl

REM �г��Ѱ�װ��linux
wsl --list

REM �� snb_linux �а�װ Docker��ͨ�� Snap��
wsl -d snb_linux --user root snap install docker

REM ���� Git ȫ���û���������
wsl -d snb_linux --user root git config --global user.name "smartnotebook"
wsl -d snb_linux --user root git config --global user.email "15492003+smartnotebook@user.noreply.gitee.com"

REM ��¡ Git �ֿ�
wsl -d snb_linux --user root git clone https://gitee.com/smartnotebook/snb-docker-compose.git

cd snb-docker-compose

REM �����¡�Ĳֿ�Ŀ¼��ִ�в���ű�
wsl -d snb_linux --user root export PATH=$PATH:/snap/bin ;sleep 2; sh deploy-simple.sh

cd ..

REM ��װ�ɹ������� snb_linux linux,����linux Ĭ���û���������
REM Ȼ��exit�˳�linux������ִ�� win_start_snb.cmd
wsl -d snb_linux --user root