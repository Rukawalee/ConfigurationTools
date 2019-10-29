@echo off
::卸载
:again0
echo 请输入MySQl安装目录：
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>? 不存在目录："%m_p%"
	goto again0
)

::判断当前系统中是否有mysql服务
sc query "mysql" | find /i "mysql" 1>NUL 2>NUL && (
    goto has_mysql
) || (
    goto no_mysql
)

::存在MySQL服务
:has_mysql
echo ^>! 清除服务中..
net stop mysql 1>NUL 2>NUL
sc delete mysql 1>NUL 2>NUL && (
    echo ^>! [MySQL]服务已经删除
)

::不存在MySQL服务
:no_mysql
echo ********************************
echo *        清除服务完毕
echo ********************************

:end_mysql
::清除注册表
echo ^>! 清除注册表中..
reg query hklm\system /s /f mysql /k >> "%m_p%\del_service.txt"
attrib +h +a +s +r "%m_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%m_p%\del_service.txt") do (
	echo "%%i" | find "搜索结束" 1>NUL 2>NUL || (
		echo ^>! 删除[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%m_p%\del_service.txt"
del "%m_p%\del_service.txt"
echo ********************************
echo *        清除注册表完毕
echo ********************************

::替换环境变量
call set path=%%path:%MYSQL_HOME%\bin=%%
setx /m Path "%path%"
echo ^>! 清除环境变量path
wmic environment where "name='MYSQL_HOME'" delete >NUL
echo ^>! 清除环境变量MYSQL_HOME
echo ********************************
echo *        清除系统环境完毕
echo ********************************

::MySQL安装包保留
echo 保留MySQL文件(y/n)？
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
::删除安装文件
rd /s /q "C:\ProgramData\MySQL" 1>NUL 2>NUL
::删除配置文件
del "%m_p%\my.ini"
del "%m_p%\userinfo.txt"
echo ********************************
echo *        [MySQL]清除完毕
echo ********************************
