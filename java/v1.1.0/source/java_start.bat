@echo off

::����JDK��װĿ¼�����л���
cd /d "%j_p%\bin"

::�Ƿ���Ҫ����jdk
echo ����JDK����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	java -version
)
echo ********************************
echo *         JDK��װ���
echo ********************************