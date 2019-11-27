::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYf5c710VTltgYDRdUMBCqem8=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYeJc703Rlm8QCChJfMBCqem8=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYeJc703RlkcUfGBpUclypbxtU
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYeJc703RllMQPDRcWfBO/Dg==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYeJc703Rli98NHg8WfBO/Dg==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYeJc703RljcUFAghMfx6nIA01vQ4=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPRuNt6Vi4idL/UB6UDYZpM5wnNUn9hCFBZUHg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OX6+e+Jnl0UV/YqaorI5rmPNuUdpEznevY=
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
::cxY6rQJ7JhzQF1fEqQImeVUFAlXi
::ZQ05rAF9IBncCkqN+0xwdVtCHUrTcjra
::ZQ05rAF9IAHYFVzEqQIdKQ1RQieNMm2zAdU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCmDKm60JboS7uH8jw==
::fBEirQZwNQPfEVWB+kM9LVsJDCmDKm60JboS7uH8jw==
::cRolqwZ3JBvQF1fEqQK08PvduMoH46Az5kqVDQV8MiSqo1sYWmXRtwoZOdQ=
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATExlc7KQxVQAGHXA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OX6+e+JnltMGrNxKbPJ37iLIfMW+XnJdIAo2FlVls0FC1VdZhfL
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
attrib +h +s "%~dp0settings.xml"
attrib +h +s "%~dp0maven_local.bat"
attrib +h +s "%~dp0java_install.bat"
attrib +h +s "%~dp0maven_install.bat"
attrib +h +s "%~dp0maven_uninstall.bat"
attrib +h +s "%~dp0maven_start.bat"
:begin
echo ********************************
echo *  windows Maven安装配置
echo *  说明：
echo *  1.安装Maven需要操作注册表
echo *  2.请以管理员方式运行程序
echo *  3.一键式操作配置环境
echo *  4.需要jdk配置支持
echo *
echo *  指令：
echo *  [1] install maven
echo *  [2] uninstall maven
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
call maven_uninstall.bat
goto end

:install
cd /d %~dp0
call maven_install.bat
cd /d %~dp0
call maven_local.bat
cd /d %~dp0
call maven_start.bat

:end
echo ^>! Bye

pause