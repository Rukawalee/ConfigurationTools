@echo off
echo ������Tomcat��װĿ¼��
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! ������Ŀ¼��"%t_p%"
	goto again0
)

::�滻��������
call set path=%%path:%CATALINA_HOME%\bin=%%
call set path=%%path:%CATALINA_HOME%\lib;=%%
setx /m path "%path%"
echo ^>! �����������path
wmic environment where "name='CATALINA_HOME'" delete >NUL
echo ^>! �����������CATALINA_HOME
wmic environment where "name='CATALINA_BASE'" delete >NUL
echo ^>! �����������CATALINA_BASE
echo ********************************
echo *        ���ϵͳ�������
echo ********************************

::���ע���
echo ^>! ���ע�����..
reg query hklm\software /f tomcat /k >> "%t_p%\del_service.txt"
attrib +h +a +s +r "%t_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%t_p%\del_service.txt") do (
	echo "%%i" | find "��������" 1>NUL 2>NUL || (
		echo ^>! ɾ��[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%t_p%\del_service.txt"
del "%t_p%\del_service.txt"
echo ********************************
echo *        ���ע������
echo ********************************

::Tomcat��װ������
echo ����Tomcat�ļ�(y/n)��
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! �����װ����..
rd /s /q "%t_p%"
echo ********************************
echo *        �����װ�����
echo ********************************

:not_del
echo ********************************
echo *        [Tomcat]������
echo ********************************