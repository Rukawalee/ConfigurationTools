@echo off

::����Tomcat��װĿ¼�����л���
cd /d "%t_p%\bin"

::�Ƿ���Ҫ����Tomcat
echo ����Tomcat����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	startup
)
echo ********************************
echo *         Tomcat��װ���
echo ********************************