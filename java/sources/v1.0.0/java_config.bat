::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+CGtEwhR+0qaozeyYiYca5DpBXYf5c710VTltgYDRdUMBCqem8=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+CGtEwhR+0qaozeyYiYca5DpBXYf5c710VJjMoeGFVafwbL
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+CGtEwhR+0qaozeyYiYca5DpBXYf5c710VPlsICHw9Zch7lbA4gyQ==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OL6+eu7skQeQPctfZzn0LWYIa4a6UqE
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
::ZQ05rAF9IAHYFVzEqQIaDDB3QwqENWza
::eg0/rx1wNQPfEVWB+kM9LVsJDC6mF0i1CLMV74g=
::fBEirQZwNQPfEVWB+kM9LVsJDC6mF0i1CLMV74g=
::cRolqwZ3JBvQF1fEqQK08PvduMoH46Az5kqVDQV8MiSthmaaui26umy7
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OL6+eu7sEgRUeMsfZznzOXAcK5D1m/AXrUi2HxTn4UJFB44
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
attrib +h +s "%~dp0java_install.bat"
attrib +h +s "%~dp0java_uninstall.bat"
attrib +h +s "%~dp0java_start.bat"
:begin
echo ********************************
echo *  windows Java��װ����
echo *  ˵����
echo *  1.��װJava��Ҫ����ע���
echo *  2.���Թ���Ա��ʽ���г���
echo *  3.һ��ʽ�������û���
echo *
echo *  ָ�
echo *  [1] install jdk
echo *  [2] uninstall jdk
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
call java_uninstall.bat
goto end

:install
cd /d %~dp0
call java_install.bat
cd /d %~dp0
call java_start.bat

:end
echo ^>! Bye

pause