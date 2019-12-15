@echo off

::查找Tomcat安装目录的运行环境
cd /d "%t_p%\bin"

::是否需要测试Tomcat
echo 启动Tomcat测试(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	startup
)
echo ********************************
echo *         Tomcat安装完成
echo ********************************