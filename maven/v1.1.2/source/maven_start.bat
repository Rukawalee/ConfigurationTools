@echo off

::����Maven��װĿ¼�����л���
cd /d "%m_p%\bin"

::�Ƿ���Ҫ����Maven
echo ����Maven����(y/n)?
set /p o=^>
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	mvn -version
)
echo ********************************
echo *         Maven��װ���
echo ********************************
