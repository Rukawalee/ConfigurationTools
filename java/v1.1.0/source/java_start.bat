@echo off

::查找JDK安装目录的运行环境
cd /d "%j_p%\bin"

::是否需要测试jdk
echo 启动JDK测试(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	java -version
)
echo ********************************
echo *         JDK安装完成
echo ********************************