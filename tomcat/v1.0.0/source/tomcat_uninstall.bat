@echo off
echo 请输入Tomcat安装目录：
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! 不存在目录："%t_p%"
	goto again0
)

::替换环境变量
call set path=%%path:%CATALINA_HOME%\bin=%%
call set path=%%path:%CATALINA_HOME%\lib;=%%
setx /m path "%path%"
echo ^>! 清除环境变量path
wmic environment where "name='CATALINA_HOME'" delete >NUL
echo ^>! 清除环境变量CATALINA_HOME
wmic environment where "name='CATALINA_BASE'" delete >NUL
echo ^>! 清除环境变量CATALINA_BASE
echo ********************************
echo *        清除系统环境完毕
echo ********************************

::清除注册表
echo ^>! 清除注册表中..
reg query hklm\software /f tomcat /k >> "%t_p%\del_service.txt"
attrib +h +a +s +r "%t_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%t_p%\del_service.txt") do (
	echo "%%i" | find "搜索结束" 1>NUL 2>NUL || (
		echo ^>! 删除[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%t_p%\del_service.txt"
del "%t_p%\del_service.txt"
echo ********************************
echo *        清除注册表完毕
echo ********************************

::Tomcat安装包保留
echo 保留Tomcat文件(y/n)？
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! 清除安装包中..
rd /s /q "%t_p%"
echo ********************************
echo *        清除安装包完毕
echo ********************************

:not_del
echo ********************************
echo *        [Tomcat]清除完毕
echo ********************************