@echo off
echo 请输入JDK安装目录：
set /p j_p=^>
if not exist "%j_p%" (
	echo ^>! 不存在目录："%j_p%"
	goto again0
)

::替换环境变量
call set path=%%path:%JAVA_HOME%\bin=%%
setx /m path "%path%"
echo ^>! 清除环境变量path
wmic environment where "name='JAVA_HOME'" delete >NUL
echo ^>! 清除环境变量JAVA_HOME
echo ********************************
echo *        清除系统环境完毕
echo ********************************

::清除注册表
echo ^>! 清除注册表中..
reg query hklm\software /f java /k >> "%j_p%\del_service.txt"
attrib +h +a +s +r "%j_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%j_p%\del_service.txt") do (
	echo "%%i" | find "搜索结束" 1>NUL 2>NUL || (
		echo ^>! 删除[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%j_p%\del_service.txt"
del "%j_p%\del_service.txt"
echo ********************************
echo *        清除注册表完毕
echo ********************************

::Java安装包保留
echo 保留Java文件(y/n)？
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! 清除安装包中..
rd /s /q "%j_p%"
echo ********************************
echo *        清除安装包完毕
echo ********************************

:not_del
echo ********************************
echo *        [JDK]清除完毕
echo ********************************