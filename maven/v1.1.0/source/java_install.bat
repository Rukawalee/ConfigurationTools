@echo off
:again0
echo ������JDK��װĿ¼��
set /p j_p=^>
if not exist "%j_p%" (
	echo ^>! ������Ŀ¼��%j_p%
	goto again0
)

::���û�������
set path=%path%;
::ȥ���ɰ滷������
if exist "%JAVA_HOME%" (
	call set path=%%path:%JAVA_HOME%\bin=%%
)
setx /m JAVA_HOME "%j_p%"
echo "%path%" | find "%JAVA_HOME%" 1>NUL 2>NUL || (
	set path=%path%%%JAVA_HOME%%\bin
)
setx /m path "%path%;"
echo ********************************
echo *        ����װ�����
echo ********************************