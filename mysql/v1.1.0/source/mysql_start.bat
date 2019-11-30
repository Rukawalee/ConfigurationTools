@echo off

::查找MySQL安装目录的运行环境
cd /d "%m_p%\bin"

::是否需要启动mysql
echo 启动MySQL测试(y/n)?
set /p o=^>
net start mysql
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	echo 登录MySQL服务
	mysql -u root -p
)
echo ********************************
echo *         MySQL安装完成
echo ********************************
