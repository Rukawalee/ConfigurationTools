@ECHO OFF
::隐藏核心文件
attrib +h +s "%~dp0my.ini"
attrib +h +s "%~dp0mysql_install.bat"
attrib +h +s "%~dp0mysql_uninstall.bat"
attrib +h +s "%~dp0mysql_start.bat"

:begin
echo ********************************
echo *  windows MySQL安装配置文件
echo *
echo *  说明：
echo *  1.安装MySQL需要操作注册表
echo *  2.请以管理员方式运行程序
echo *  3.减少开发者配置环境时间
echo *  4.一键式操作配置环境
echo *
echo *  感谢：互联网上安装方案
echo *
echo *  指令：
echo *  [1] install mysql
echo *  [2] uninstall mysql
echo *  [0] exit process
echo ********************************
net session 1>NUL 2>NUL && (
	goto admin
) || (
	goto not_admin
)
::非管理员
:not_admin
echo ^>? 请以管理员方式运行程序
goto end

::管理员
:admin
echo 输入指令：
set /p command=^>
if "%command%" == "1" (
	goto install
) else if "%command%" == "2" (
	goto uninstall
) else if "%command%" == "0" (
	goto end
) else (
	echo ^>? 输入指令不正确
	echo.
	goto begin
)

::卸载
:uninstall
cd /d %~dp0
call mysql_uninstall.bat

goto end

::安装
:install
cd /d %~dp0
call mysql_install.bat
cd /d %~dp0
call mysql_start.bat

:end
echo ^>! Bye
pause
