@echo off
::���غ����ļ�
attrib -h -s "%~dp0tomcat_install.bat"
attrib -h -s "%~dp0tomcat_uninstall.bat"
attrib -h -s "%~dp0tomcat_start.bat"

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