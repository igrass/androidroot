echo off
cls
echo .
echo. ˢ�������ƽ�����ݣ�����ǰ���ñ���...
echo. ȷ��ƽ������Ѿ����ӵ���ĵ���...
echo. ˢ�������в�Ҫ�ر�ƽ�����...
echo .
CHOICE /C YN /M "׼������?��ȷ��Ҫ������? Y - ׼������, N - ��û׼����"

IF ERRORLEVEL 2 GOTO End2
IF ERRORLEVEL 1 GOTO Flash

:Flash
CLS
IF EXIST droidboot.img (
@adb wait-for-device
adb reboot bootloader
echo .
echo .  ���ƽ�彫�ػ������ֵ�ر�־�󿪻�����fastbootģʽ
echo .
echo .  ��������fastbootģʽ
echo .
) else echo .  �豸û���ҵ�...����һ��...
goto End1

:End1
echo .
echo .  �����������...
pause > nul
2fastboot.bat 1


:End2
echo .
echo .  �����������...
pause > nul
̨��ˢ����ݹ�����.bat 1
