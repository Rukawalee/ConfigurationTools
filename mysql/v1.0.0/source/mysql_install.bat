@echo off
:again
echo 请输入MySQl安装目录：
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>? 不存在目录："%m_p%"
	goto again
)

::获取当前盘符和路径
set m_i=%~dp0
::复制配置文件
set d_m=%m_p%\my.ini
::文件空行不忽略
echo ^> 配置更新中..
for /f "tokens=1* delims=:" %%i in ('findstr /n .* %m_i%my.ini') do (
	if "%%j" == "basedir=" (
		echo basedir="%m_p:\=/%" >> "%d_m%"
	) else if "%%j" == "datadir=" (
		echo datadir=%m_p:\=\\%\\data >> "%d_m%"
	) else (
		if "%%j" equ "" (
			echo. >> "%d_m%"
		) else (
			echo %%j >> "%d_m%"
		)
	)
)
echo ********************************
echo *        配置更新完毕
echo ********************************

::设置mysql系统变量
echo ^> 系统环境装配中..
set path=%path%
setx /m MYSQL_HOME "%m_p%"
echo "%path%" | find "%m_p%" 1>NUL 2>NUL || (
	set path=%path%%%MYSQL_HOME%%\bin
)
setx /m path "%path%"
echo ********************************
echo *        环境装配完毕
echo ********************************

::查找MySQL安装目录的运行环境
cd /d "%m_p%\bin"

::mysql设置
echo 请输入[MySQL]重置密码：
set /p pwd=^>
set dest=%m_p%\userinfo.txt
echo MySQL账户信息：> "%dest%"
echo 用户：root >> "%dest%"
echo 密码：%pwd% >> "%dest%"

echo ********************************
echo *        设置密码：%pwd%
echo *  用户信息已保存到安装目录下
echo *  userinfo.txt文件中
echo ********************************

echo ALTER USER 'root'@'localhost' IDENTIFIED BY '%pwd%' PASSWORD EXPIRE NEVER; > "%m_i%pwd.txt"
attrib +h +s +a +r "%m_i%pwd.txt"
echo ^> MySQL初始化中..
mysqld --initialize --init-file="%m_i%pwd.txt" --console
attrib -h -s -a -r "%m_i%pwd.txt"
del "%m_i%pwd.txt"
sc query mysql && 1>NUL 2>NUL (
    echo ^>! MySQL服务已经安装
) || (
    mysqld --install
)
echo ********************************
echo *        MySQL初始化完毕
echo ********************************
