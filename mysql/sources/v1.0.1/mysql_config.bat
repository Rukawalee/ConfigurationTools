::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eesVwRaPEwbZ3Y36eyNrFdugu1SZs0mHNUkas=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eesVwRaPEwbZ3Y36eyNrFdugu1SZs0xWtWp8ICHw9Zch7lbA4gyQ==
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eesVwRaPEwbZ3Y36eyNrFdugu1SZs0xWtWp9gYDQlMMBCqem8=
::fBE1pAF6MU+EWH3eyHAlIxpDTQiHOVe5Cbsa4e/o0+eesVwRaPEwbZ3Y36eyNrFdugu1SZs0xWtWp94CBRVLahOnYkE2qHoi
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OXi/PuLnl0UV/YqaorI5rmXM/EfpEznevY=
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
::cxY6rQJ7JhzQF1fEqQJhZksaHWQ=
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbQs=
::ZQ05rAF9IAHYFVzEqQIdMShlYCeNMm2zAdU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCmbD1qWJboS7uH8jw==
::fBEirQZwNQPfEVWB+kM9LVsJDCmbD1qWJboS7uH8jw==
::cRolqwZ3JBvQF1fEqQK199DdrPsL2YY923sx8dvKw21pbcjft4I=
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wGg5fTRODMG6/Zg==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuR/0MnKRdRSTiBM2W8D7IP1OXi/PuLnl8YWOc+a4rI5qLfbrBdu3nJbKUc+llVls0FC1VdZhfL
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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
