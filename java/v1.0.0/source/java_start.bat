@echo off
::���غ����ļ�
attrib -h -s "%~dp0java_install.bat"
attrib -h -s "%~dp0java_uninstall.bat"
attrib -h -s "%~dp0java_start.bat"

::����MySQL��װĿ¼�����л���
cd /d "%j_p%\bin"

::�Ƿ���Ҫ����jdk
echo ����JDK����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	java -v
)
echo ********************************
echo *         JDK��װ���
echo ********************************