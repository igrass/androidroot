echo off
cls
echo .
echo .
echo �豸 %MYVAR% �Ѿ�����...���ڿ�ʼ˫ϵͳ��ˢ��׿...
Timeout /t 3

cls

echo.  Wait Please! Flashing......
echo.
echo.
@fastboot oem write_osip_header
echo .
echo .
fastboot erase system
echo .
echo .
@fastboot erase cache
echo .
echo .
@fastboot erase data
echo .
echo .
@fastboot flash recovery recovery.img
echo .
echo .
@fastboot flash fastboot droidboot.img
echo .
echo .
@fastboot flash boot boot.img
echo .
echo .
@fastboot flash splashscreen bootlogo.bin
echo .
echo .
@fastboot flash system system.img
echo .
echo .
echo .  �ܺã�һ�н�չ˳��...
echo .  ���ƽ�彫�������밲׿...
echo .
fastboot continue
echo .
goto End1


:End1
echo .
echo .  ��������������˵�...
pause > nul
̨��ˢ����ݹ�����.bat 1

echo .
echo .
@fastboot flash system system.img
echo .
echo .
echo .  �ܺã�һ�н�չ˳��...
echo .  �뽫ƽ�忪�����밲׿...
echo .
fastboot continue
echo .
