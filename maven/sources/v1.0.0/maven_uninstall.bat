@echo off
:again0
echo 请输入Maven安装目录：
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>! 不存在目录："%m_p%"
	goto again0
)

::替换环境变量
call set path=%%path:%MAVEN_HOME%\bin=%%
setx /m path "%path%"
echo ^>! 清除环境变量path
wmic environment where "name='MAVEN_HOME'" delete >NUL
echo ^>! 清除环境变量MAVEN_HOME
echo ********************************
echo *        清除系统环境完毕
echo ********************************

::Maven安装包保留
echo 保留Maven文件(y/n)？
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! 清除安装包中..
rd /s /q "%m_p%"
echo ********************************
echo *        清除安装包完毕
echo ********************************

:not_del
echo ********************************
echo *        [Maven]清除完毕
echo ********************************