@echo off
::���غ����ļ�
attrib -h -s "%~dp0maven_install.bat"
attrib -h -s "%~dp0maven_uninstall.bat"
attrib -h -s "%~dp0maven_start.bat"

::����MySQL��װĿ¼�����л���
cd /d "%m_p%\bin"

::�Ƿ���Ҫ����maven
echo ����Maven����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	mvn -version
)
echo ********************************
echo *         Maven��װ���
echo ********************************
