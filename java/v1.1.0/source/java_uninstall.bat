@echo off
echo ������JDK��װĿ¼��
set /p j_p=^>
if not exist "%j_p%" (
	echo ^>! ������Ŀ¼��"%j_p%"
	goto again0
)

::�滻��������
call set path=%%path:%JAVA_HOME%\bin=%%
setx /m path "%path%"
echo ^>! �����������path
wmic environment where "name='JAVA_HOME'" delete >NUL
echo ^>! �����������JAVA_HOME
echo ********************************
echo *        ���ϵͳ�������
echo ********************************

::���ע���
echo ^>! ���ע�����..
reg query hklm\software /f java /k >> "%j_p%\del_service.txt"
attrib +h +a +s +r "%j_p%\del_service.txt"
for /f "usebackq delims=" %%i in ("%j_p%\del_service.txt") do (
	echo "%%i" | find "��������" 1>NUL 2>NUL || (
		echo ^>! ɾ��[%%i]
		reg delete "%%i" /f 1>NUL 2>NUL
	)
)
attrib -h -a -s -r "%j_p%\del_service.txt"
del "%j_p%\del_service.txt"
echo ********************************
echo *        ���ע������
echo ********************************

::Java��װ������
echo ����Java�ļ�(y/n)��
set /p u=^>
echo "%u%" | find /i "y" 1>NUL 2>NUL && (
	goto not_del
)
echo ^>! �����װ����..
rd /s /q "%j_p%"
echo ********************************
echo *        �����װ�����
echo ********************************

:not_del
echo ********************************
echo *        [JDK]������
echo ********************************