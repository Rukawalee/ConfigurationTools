@echo off
:again0
echo ������Maven��װĿ¼��
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>! ������Ŀ¼��"%m_p%"
	goto again0
)

::�滻��������
call set path=%%path:%MAVEN_HOME%\bin=%%
setx /m path "%path%"
echo ^>! �����������path
wmic environment where "name='MAVEN_HOME'" delete >NUL
echo ^>! �����������MAVEN_HOME
echo ********************************
echo *        ���ϵͳ�������
echo ********************************

::Maven��װ������
echo ����Maven�ļ�(y/n)��
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
echo ********************************
echo *        [Maven]������
echo ********************************