@ECHO OFF
::���غ����ļ�
attrib +h +s "%~dp0my.ini"
attrib +h +s "%~dp0mysql_install.bat"
attrib +h +s "%~dp0mysql_uninstall.bat"
attrib +h +s "%~dp0mysql_start.bat"

:begin
echo ********************************
echo *  windows MySQL��װ�����ļ�
echo *
echo *  ˵����
echo *  1.��װMySQL��Ҫ����ע���
echo *  2.���Թ���Ա��ʽ���г���
echo *  3.���ٿ��������û���ʱ��
echo *  4.һ��ʽ�������û���
echo *
echo *  ��л���������ϰ�װ����
echo *
echo *  ָ�
echo *  [1] install mysql
echo *  [2] uninstall mysql
echo *  [0] exit process
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

::ж��
:uninstall
cd /d %~dp0
call mysql_uninstall.bat

goto end

::��װ
:install
cd /d %~dp0
call mysql_install.bat
cd /d %~dp0
call mysql_start.bat

:end
echo ^>! Bye
pause
