@echo off

::����MySQL��װĿ¼�����л���
cd /d "%m_p%\bin"

::�Ƿ���Ҫ����mysql
echo ����MySQL����(y/n)?
set /p o=^>
net start mysql
echo "%o%" | find /i "y" 1>NUL 2>NUL && (
	echo ��¼MySQL����
	mysql -u root -p
)
echo ********************************
echo *         MySQL��װ���
echo ********************************
