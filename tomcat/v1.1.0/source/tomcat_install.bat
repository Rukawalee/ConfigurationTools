@echo off
:again0
echo ������Tomcat��װĿ¼��
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! ������Ŀ¼��%t_p%
	goto again0
)

::���û�������
set path=%path%;
::ȥ���ɰ滷������
if exist "%CATALINA_HOME%" (
	call set path=%%path:%CATALINA_HOME%\bin=%%
	call set path=%%path:%CATALINA_HOME%\lib;=%%
)
setx /m CATALINA_BASE "%t_p%"
setx /m CATALINA_HOME "%t_p%"
::���tomcat��������
set path=%path%%%CATALINA_HOME%%\lib;%%CATALINA_HOME%%\bin
setx /m path "%path%;"
echo ********************************
echo *        ����װ�����
echo ********************************