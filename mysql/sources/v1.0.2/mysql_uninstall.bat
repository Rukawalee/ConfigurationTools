@echo off
::ж��
:again0
echo ������MySQl��װĿ¼��
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>? ������Ŀ¼��"%m_p%"
	goto again0
)

::�жϵ�ǰϵͳ���Ƿ���mysql����
sc query "mysql" | find /i "mysql" 1>NUL 2>NUL && (
    goto has_mysql
) || (
    goto no_mysql
)

::����MySQL����
:has_mysql
echo ^>! ���������..
net stop mysql 1>NUL 2>NUL
sc delete mysql 1>NUL 2>NUL && (
    echo ^>! [MySQL]�����Ѿ�ɾ��
)

::������MySQL����
:no_mysql
echo ********************************
echo *        ����������
echo ********************************

:end_mysql
::���ע���
echo ^>! ���ע�����..
reg query hklm\system /s /f mysql /k >> "%m_p%\del_service.txt"
attrib +h +a +s +r "%m_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%m_p%\del_service.txt") do (
	echo "%%i" | find "��������" 1>NUL 2>NUL || (
		echo ^>! ɾ��[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%m_p%\del_service.txt"
del "%m_p%\del_service.txt"
echo ********************************
echo *        ���ע������
echo ********************************

::�滻��������
call set path=%%path:%MYSQL_HOME%\bin=%%
setx /m Path "%path%"
echo ^>! �����������path
wmic environment where "name='MYSQL_HOME'" delete >NUL
echo ^>! �����������MYSQL_HOME
echo ********************************
echo *        ���ϵͳ�������
echo ********************************

::MySQL��װ������
echo ����MySQL�ļ�(y/n)��
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! �����װ����..
rd /s /q "%m_p%"
echo ********************************
echo *        �����װ�����
echo ********************************

:not_del
::ɾ����װ�ļ�
rd /s /q "C:\ProgramData\MySQL" 1>NUL 2>NUL
::ɾ�������ļ�
del "%m_p%\my.ini"
del "%m_p%\userinfo.txt"
echo ********************************
echo *        [MySQL]������
echo ********************************
