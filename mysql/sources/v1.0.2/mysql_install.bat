::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:again
echo ������MySQl��װĿ¼��
set /p m_p=^>
if not exist "%m_p%" (
	echo ^>? ������Ŀ¼��"%m_p%"
	goto again
)

::��ȡ��ǰ�̷���·��
set m_i=%~dp0
::���������ļ�
set d_m=%m_p%\my.ini
::�ļ����в�����
echo ^> ���ø�����..
for /f "tokens=1* delims=:" %%i in ('findstr /n .* %m_i%my.ini') do (
	if "%%j" == "basedir=" (
		echo basedir="%m_p:\=/%" >> "%d_m%"
	) else if "%%j" == "datadir=" (
		echo datadir=%m_p:\=\\%\\data >> "%d_m%"
	) else (
		if "%%j" equ "" (
			echo. >> "%d_m%"
		) else (
			echo %%j >> "%d_m%"
		)
	)
)
echo ********************************
echo *        ���ø������
echo ********************************

::����mysqlϵͳ����
echo ^> ϵͳ����װ����..
set path=%path%
setx /m MYSQL_HOME "%m_p%"
echo %path% | find "%m_p%" 1>NUL 2>NUL || (
	set path=%path%%%MYSQL_HOME%%\bin
)
setx /m path "%path%"
echo ********************************
echo *        ����װ�����
echo ********************************

::����MySQL��װĿ¼�����л���
cd /d "%m_p%\bin"

::mysql����
echo ������[MySQL]�������룺
set /p pwd=^>
set dest=%m_p%\userinfo.txt
echo MySQL�˻���Ϣ��> "%dest%"
echo �û���root >> "%dest%"
echo ���룺%pwd% >> "%dest%"

echo ********************************
echo *        �������룺%pwd%
echo *  �û���Ϣ�ѱ��浽��װĿ¼��
echo *  userinfo.txt�ļ���
echo ********************************

echo ALTER USER 'root'@'localhost' IDENTIFIED BY '%pwd%' PASSWORD EXPIRE NEVER; > "%m_i%pwd.txt"
attrib +h +s +a +r "%m_i%pwd.txt"
echo ^> MySQL��ʼ����..
mysqld --initialize --init-file="%m_i%pwd.txt" --console
attrib -h -s -a -r "%m_i%pwd.txt"
del "%m_i%pwd.txt"
sc query mysql && 1>NUL 2>NUL (
    echo ^>! MySQL�����Ѿ���װ
) || (
    mysqld --install
)
echo ********************************
echo *        MySQL��ʼ�����
echo ********************************
