color 11
echo off
:Menu
cls
echo .
echo .
echo .			������������������
echo .			��       ̨��ˢ����ݹ�����     ��
echo .			��    http://bbs.teclast.com    ��
echo .			��            ������            ��
echo .			��         2014.12.31           ��
echo .			������������������
echo .		����ȷ�� :
echo .		- ���������Ƿ����50%  ����������㽨���ȳ��!!!
echo .		- ƽ���Ƿ����ӵ�����
echo .		- ���ν���ƽ�������--������ѡ���£���ѡusb����
echo .
echo .		1)����fastboot��ˢ��׿����10%%ר�ã�˫ϵͳ��ˢ��׿Ҫѡ2��������
echo .		2)����fastboot��ˢ��׿��˫ϵͳ��ˢ��׿��10%%ר�ã�
echo .		3)����ROOT
echo .		4)ˢBIOS
echo .
echo .
CHOICE /C 1234 /M "ѡ������ 1-4 ���� Q - �˳�."

IF ERRORLEVEL 4 GOTO Menu4
IF ERRORLEVEL 3 GOTO Menu3
IF ERRORLEVEL 2 GOTO Menu2
IF ERRORLEVEL 1 GOTO Menu1

:Menu1
fastboot.bat
GOTO Menu

:Menu2
fastboot_nopartition.bat
GOTO Menu

:Menu3
ROOT.bat
GOTO Menu

:Menu4
BIOS.bat
GOTO Menu

:End
adb kill-server
cls
echo off
exit