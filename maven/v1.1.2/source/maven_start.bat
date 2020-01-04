@echo off

::查找Maven安装目录的运行环境
cd /d "%m_p%\bin"

::是否需要测试Maven
echo 启动Maven测试(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	mvn -version
)
echo ********************************
echo *         Maven安装完成
echo ********************************
