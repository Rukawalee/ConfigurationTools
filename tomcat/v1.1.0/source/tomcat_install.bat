@echo off
:again0
echo 请输入Tomcat安装目录：
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! 不存在目录：%t_p%
	goto again0
)

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