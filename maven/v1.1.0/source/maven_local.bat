@echo off
echo ������Maven���زֿ⣺
set /p m_l=^>
set m_l=%m_l%\.m2\repository
if not exist "%m_l%" (
	mkdir "%m_l%"
)
echo ^> ���������ļ���..
set l_s=%~dp0
set m_s=%m_p%\conf\settings.xml
::ɾ��Դ�����ļ�
if exist "%m_s%" (
	del "%m_s%"
)
for /f "tokens=1* delims=:" %%i in ('findstr /n .* %l_s%settings.xml') do (
	if "%%j" == "<localRepository>" (
		echo ^<localRepository^>%m_l:\=/%^</localRepository^> >> "%m_s%"
	) else if "%%j" equ "" (
		echo. >> "%m_s%"
	) else (
		echo %%j >> "%m_s%"
	)
)
echo ********************************
echo *        ���ø������
echo ********************************