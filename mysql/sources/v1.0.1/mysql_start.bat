@echo off
::���غ����ļ�
attrib -h -s "%~dp0my.ini"
attrib -h -s "%~dp0mysql_install.bat"
attrib -h -s "%~dp0mysql_uninstall.bat"
attrib -h -s "%~dp0mysql_start.bat"

::����MySQL��װĿ¼�����л���
cd /d "%m_p%\bin"

::�Ƿ���Ҫ����mysql
echo ����MySQL����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	net start mysql
	echo ��¼MySQL����
	mysql -u root -p
)
echo ********************************
echo *         MySQL��װ���
echo ********************************
