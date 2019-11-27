@echo off
:again
echo 请输入Maven安装目录：
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>! 不存在目录：%m_p%
	goto again
)

::设置环境变量
set path=%path%
::去除旧版环境变量
if exist "%MAVEN_HOME%" (
	call set path=%%path:%MAVEN_HOME%\bin=%%
)
setx /m MAVEN_HOME "%m_p%"
echo "%path%" | find "%m_p%" 1>NUL 2>NUL || (
	set path=%path%%%MAVEN_HOME%%\bin
)
setx /m path "%path%;"
set path=%path%;

::判断是否存在JAVA_HOME
echo.
echo 请进行JDK环境变量进行配置
if not exist "%JAVA_HOME%" (
	cd /d %~dp0
	start /wait java_install.bat exit exit
)

echo ********************************
echo *        环境装配完毕
echo ********************************