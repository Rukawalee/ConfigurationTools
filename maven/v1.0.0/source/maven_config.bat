@echo off
attrib +h +s "%~dp0java_install.bat"
attrib +h +s "%~dp0maven_install.bat"
attrib +h +s "%~dp0maven_uninstall.bat"
attrib +h +s "%~dp0maven_start.bat"
:begin
echo ********************************
echo *  windows Maven��װ����
echo *  ˵����
echo *  1.��װMaven��Ҫ����ע���
echo *  2.���Թ���Ա��ʽ���г���
echo *  3.һ��ʽ�������û���
echo *  4.��Ҫjdk����֧��
echo *
echo *  ָ�
echo *  [1] install maven
echo *  [2] uninstall maven
echo *  [0] exit
echo ********************************
net session 1>NUL 2>NUL && (
	goto admin
) || (
	goto not_admin
)

::�ǹ���Ա
:not_admin
echo ^>? ���Թ���Ա��ʽ���г���
goto end

::����Ա
:admin
echo ����ָ�
set /p command=^>
if "%command%" == "1" (
	goto install
) else if "%command%" == "2" (
	goto uninstall
) else if "%command%" == "0" (
	goto end
) else (
	echo ^>? ����ָ���ȷ
	echo.
	goto begin
)

:uninstall
cd /d %~dp0
call maven_uninstall.bat
goto end

:install
cd /d %~dp0
call maven_install.bat
cd /d %~dp0
call maven_start.bat

:end
echo ^>! Bye

pause