::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0/6Ir04cQN4pKcGKlOSyM+8G+EbhSYIi23lbjPQFAghMfx6nIA01vQ4=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0/6Ir04cQN4pKcGKlOSyM+8G+EbhSYIi23lbjPQfGBpKalypbxtU
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0/6Ir04cQN4pKcGKlOSyM+8G+EbhSYIi23lbjPQZAhJWbQaqYgN6q29W1g==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1Pz04umGtnENXeErbZ3eyYiaL+0Q61GqfJUitg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQImeVUFAlTi
::ZQ05rAF9IBncCkqN+0xwdVtCHUrTcjva
::ZQ05rAF9IAHYFVzEqQIEJxZXTRChM2W8D7J8
::eg0/rx1wNQPfEVWB+kM9LVsJDDCNMWi7EpYT5u7y6Io=
::fBEirQZwNQPfEVWB+kM9LVsJDDCNMWi7EpYT5u7y6Io=
::cRolqwZ3JBvQF1fEqQK08PvduMoH46Az5kqVDQV8MiSzrUAeVfa4lkBeGFfu
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATExlc7KQxVQAGHXA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1Pz04umGtnELBaxuNt/nyLGCJeEA73nQepsu1255l8UKBRwWewquDg==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
attrib +h +s "%~dp0tomcat_install.bat"
attrib +h +s "%~dp0tomcat_uninstall.bat"
attrib +h +s "%~dp0tomcat_start.bat"
:begin
echo ********************************
echo *  windows Tomcat安装配置
echo *  说明：
echo *  1.安装Tomcat需要操作注册表
echo *  2.请以管理员方式运行程序
echo *  3.一键式操作配置环境
echo *
echo *  指令：
echo *  [1] install tomcat
echo *  [2] uninstall tomcat
echo *  [0] exit
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

:uninstall
cd /d %~dp0
call tomcat_uninstall.bat
goto end

:install
cd /d %~dp0
call tomcat_install.bat
cd /d %~dp0
call tomcat_start.bat

:end
echo ^>! Bye

pause