::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe4B6Ef4M7y4++UnkAER/MzRILClL2AKYA=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe4B6Ef4M7y4++UnkAER/MzRILCyaWCH+kd+VHleZpj1HtO+A==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe4B6Ef4M7y4++UnkAER/MzRILCyaWCH/MH61fwO5Qswho=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe4B6Ef4M7y4++UnkAER/MzRILCyaWCH/Ud40v3YZch2jRYmd9s
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiAPX+5DpMV5O3o0+eesVwRaO8ma57X5eLaMPgsuxW9J8R1hUVfmdgVBRhXcFylaxt6oG1N1g==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXoZg==
::ZQ05rAF9IAHYFVzEqQIdMShlYCeNMm2zAdU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCmbD1qWJboS7uH8jw==
::fBEirQZwNQPfEVWB+kM9LVsJDCmbD1qWJboS7uH8jw==
::cRolqwZ3JBvQF1fEqQK49v7Rps21NWW+CaIPbTQbagV2JpfH0RPH/VAQU1RxqQX+bZgqWI8e53Y6
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATExlc7KQxVQAGHXA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wGg5fTRODMG6/Zg==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OXi/PuLnmAEZ9MTW4DV3L2JbuUL7yU=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
::隐藏核心文件
attrib +h +s "%~dp0my.ini"
attrib +h +s "%~dp0mysql_install.bat"
attrib +h +s "%~dp0mysql_uninstall.bat"
attrib +h +s "%~dp0mysql_start.bat"

:begin
echo ********************************
echo *  windows MySQL安装配置文件
echo *
echo *  说明：
echo *  1.安装MySQL需要操作注册表
echo *  2.请以管理员方式运行程序
echo *  3.减少开发者配置环境时间
echo *  4.一键式操作配置环境
echo *
echo *  感谢：互联网上安装方案
echo *
echo *  指令：
echo *  [1] install mysql
echo *  [2] uninstall mysql
echo *  [0] exit process
echo ********************************
net session 1>NUL 2>NUL && (
	goto admin
) || (
	goto not_admin
)
::非管理员
:not_admin
echo ^>? 请以管理员方式运行程序
goto end

::管理员
:admin
echo 输入指令：
set /p command=^>
if "%command%" == "1" (
	goto install
) else if "%command%" == "2" (
	goto uninstall
) else if "%command%" == "0" (
	goto end
) else (
	echo ^>? 输入指令不正确
	echo.
	goto begin
)

::卸载
:uninstall
cd /d %~dp0
call mysql_uninstall.bat

goto end

::安装
:install
cd /d %~dp0
call mysql_install.bat
cd /d %~dp0
call mysql_start.bat

:end
echo ^>! Bye
pause
