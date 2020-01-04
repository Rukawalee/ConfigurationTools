@echo off
echo 请输入Maven本地仓库（直接回车表示默认）：
set /p m_l=^>
if "%m_l%" == "" goto m_l_finish
set m_l=%m_l%\.m2\repository
if not exist "%m_l%" (
	mkdir "%m_l%"
)
echo ^> 更新配置文件中..
set l_s=%~dp0
set m_s=%m_p%\conf\settings.xml
::删除源配置文件
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
:m_l_finish
echo ********************************
echo *        配置更新完毕
echo ********************************