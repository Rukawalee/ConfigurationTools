::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPEwbZ3Y36eyNrFdugu0SZwswHtlkcUfGBpUclypbxtU
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPEwbZ3Y36eyNrFdugu0SZsswH9Up8ICHw9Zch7lbA4gyQ==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPEwbZ3Y36eyNrFdugu0SZsswH9Up9gYDQlMMBCqem8=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eGtEgTaPEwbZ3Y36eyNrFdugu0SZsswH9Up94CBRVLahOnYkE2qHoi
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
::cxY6rQJ7JhzQF1fEqQJhZksaHGQ=
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbAs=
::ZQ05rAF9IAHYFVzEqQIdKQ1RQieNMm2zAdU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCmDKm60JboS7uH8jw==
::fBEirQZwNQPfEVWB+kM9LVsJDCmDKm60JboS7uH8jw==
::cRolqwZ3JBvQF1fEqQK08PvduMoH46Az5kqVDQV8MiSqo1sYWmXRtwoZOdQ=
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OX6+e+Jnl8YWOc+a4rI5qLfbrBdunnJdIAo2FlVls0FC1VdZhfL
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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