echo off
cls
echo .
echo. ˢ�������ƽ�����ݣ�����ǰ���ñ���...
echo. ȷ��ƽ������Ѿ����ӵ���ĵ���...
echo. ˢ�������в�Ҫ�ر�ƽ�����...
echo .
CHOICE /C YN /M "׼������?��ȷ��Ҫ������? Y - ׼������, N - ��û׼����"

IF ERRORLEVEL 2 GOTO End1
IF ERRORLEVEL 1 GOTO Flash

:Flash
CLS
IF EXIST droidboot.img (
echo .
echo .  ���ƽ�彫��������fastbootģʽ...
echo .
echo .
@adb wait-for-device
adb reboot bootloader
echo .

echo .  Connecting to a device...
Timeout /t 45 >nul
for /F "tokens=*" %%l in ('fastboot devices') do set MYVAR=%%l

echo %MYVAR% | find "fastboot" > nul
IF not errorlevel 1 (

cls
echo .
echo .
echo �豸 %MYVAR% �Ѿ�����...���ڿ�ʼ...
Timeout /t 3

cls

echo.  Wait Please! Flashing......
echo.
echo.
@fastboot oem write_osip_header
echo .
echo .
@fastboot oem start_partitioning
echo .
echo .
@fastboot flash /tmp/partition.tbl partition.tbl
echo .
echo .
@fastboot oem partition /tmp/partition.tbl
echo .
echo .
fastboot erase system
echo .
echo .
@fastboot erase cache
echo .
echo .
@fastboot erase logs
echo .
echo .
echo .
@fastboot erase data

echo .
echo .
@fastboot oem stop_partitioning
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

) else echo .  �豸û���ҵ�...����һ��...
) else echo .  �̼��ļ�û���ҵ�����ȷ���̼��ļ��Ѿ����ز�����ָ��·��...
goto End1


:End1
echo .
echo .  ��������������˵�...
pause > nul
̨��ˢ����ݹ�����.bat 1
