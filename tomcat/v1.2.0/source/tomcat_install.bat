@echo off
:again0
echo 请输入Tomcat安装目录：
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! 不存在目录：%t_p%
	goto again0
)
::echo 请输入Tomcat管理用户名：
::set /p username=^>
::echo 请输入Tomcat管理密码：
::set /p password=^>

:: 保存用户信息
::set dest=%t_p%\userinfo.txt
::echo.
::echo Tomcat用户信息 > "%dest%"
::echo 用户：%username% >> "%dest%"
::echo 密码：%password% >> "%dest%"
::echo 作用：Tomcat WEB应用管理 >> "%dest%"
::echo 请记住用户[%username%]，密码[%password%]以管理Tomcat
::echo 已将信息保存["%dest%"]

:: 填充配置文件
::set prop=%~dp0tomcat-users.xml%
::set d_prop=%t_p%\conf\tomcat-users.xml
echo 配置更新中..
::for /f "tokens=1* delims=:" %%i in ('findstr /n .* %prop%') do (
::	%%j
::)

::备份历史数据
set src=%~dp0tomcat-users.xml
set dest=%t_p%\conf\tomcat-users.xml
if not exist "%dest%.bak" (
	copy "%dest%" "%dest%.bak" 1>NUL 2>NUL
)
attrib -h -s "%src%"
copy "%src%" "%dest%" 1>NUL 2>NUL
attrib +h +s "%src%"
echo ********************************
echo *        配置更新完毕
echo ********************************

::设置环境变量
set path=%path%;
::去除旧版环境变量
if exist "%CATALINA_HOME%" (
	call set path=%%path:%CATALINA_HOME%\bin=%%
	call set path=%%path:%CATALINA_HOME%\lib;=%%
)
setx /m CATALINA_BASE "%t_p%"
setx /m CATALINA_HOME "%t_p%"
::添加tomcat环境变量
set path=%path%%%CATALINA_HOME%%\lib;%%CATALINA_HOME%%\bin
setx /m path "%path%;"
echo ********************************
echo *        环境装配完毕
echo ********************************