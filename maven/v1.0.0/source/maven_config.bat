@echo off
attrib +h +s "%~dp0java_install.bat"
attrib +h +s "%~dp0maven_install.bat"
attrib +h +s "%~dp0maven_uninstall.bat"
attrib +h +s "%~dp0maven_start.bat"
:begin
echo ********************************
echo *  windows Maven安装配置
echo *  说明：
echo *  1.安装Maven需要操作注册表
echo *  2.请以管理员方式运行程序
echo *  3.一键式操作配置环境
echo *  4.需要jdk配置支持
echo *
echo *  指令：
echo *  [1] install maven
echo *  [2] uninstall maven
echo *  [0] exit
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

:uninstall
cd /d %~dp0
call maven_uninstall.bat
goto end

:install
cd /d %~dp0
call maven_install.bat
cd /d %~dp0
call maven_start.bat

:end
echo ^>! Bye

pause