@echo off
:again
echo ������Maven��װĿ¼��
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>! ������Ŀ¼��%m_p%
	goto again
)

::���û�������
set path=%path%
::ȥ���ɰ滷������
if exist "%MAVEN_HOME%" (
	call set path=%%path:%MAVEN_HOME%\bin=%%
)
setx /m MAVEN_HOME "%m_p%"
echo "%path%" | find "%m_p%" 1>NUL 2>NUL || (
	set path=%path%%%MAVEN_HOME%%\bin
)
setx /m path "%path%;"
set path=%path%;

::�ж��Ƿ����JAVA_HOME
echo.
echo �����JDK����������������
if not exist "%JAVA_HOME%" (
	cd /d %~dp0
	start /wait java_install.bat exit exit
)

echo ********************************
echo *        ����װ�����
echo ********************************