@echo off
:again0
echo 请输入JDK安装目录：
set /p j_p=^>
if not exist "%j_p%" (
	echo ^>! 不存在目录：%j_p%
	goto again0
)

::设置环境变量
set path=%path%;
::去除旧版环境变量
if exist "%JAVA_HOME%" (
	call set path=%%path:%JAVA_HOME%\bin=%%
)
setx /m JAVA_HOME "%j_p%"
echo "%path%" | find "%JAVA_HOME%" 1>NUL 2>NUL || (
	set path=%path%%%JAVA_HOME%%\bin
)
setx /m path "%path%;"
echo ********************************
echo *        环境装配完毕
echo ********************************