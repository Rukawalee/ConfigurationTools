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
echo "%path%" | find "%m_p%" 1>NUL 2>NUL || (
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
