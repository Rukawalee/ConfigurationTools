@echo off
:again0
echo ������Tomcat��װĿ¼��
set /p t_p=^>
if not exist "%t_p%" (
	echo ^>! ������Ŀ¼��%t_p%
	goto again0
)
::echo ������Tomcat�����û�����
::set /p username=^>
::echo ������Tomcat�������룺
::set /p password=^>

:: �����û���Ϣ
::set dest=%t_p%\userinfo.txt
::echo.
::echo Tomcat�û���Ϣ > "%dest%"
::echo �û���%username% >> "%dest%"
::echo ���룺%password% >> "%dest%"
::echo ���ã�Tomcat WEBӦ�ù��� >> "%dest%"
::echo ���ס�û�[%username%]������[%password%]�Թ���Tomcat
::echo �ѽ���Ϣ����["%dest%"]

:: ��������ļ�
::set prop=%~dp0tomcat-users.xml%
::set d_prop=%t_p%\conf\tomcat-users.xml
echo ���ø�����..
::for /f "tokens=1* delims=:" %%i in ('findstr /n .* %prop%') do (
::	%%j
::)

::������ʷ����
set src=%~dp0tomcat-users.xml
set dest=%t_p%\conf\tomcat-users.xml
if not exist "%dest%.bak" (
	copy "%dest%" "%dest%.bak" 1>NUL 2>NUL
)
attrib -h -s "%src%"
copy "%src%" "%dest%" 1>NUL 2>NUL
attrib +h +s "%src%"
echo ********************************
echo *        ���ø������
echo ********************************

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