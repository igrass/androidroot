echo off
cls
echo .
echo .  ע�⣡��Ҫ���е���ˢ��bios����...
echo .  ��ǰ��������Ӧ��bios�ļ�����xxx.bin������bios�ļ����в�����BIOS.bin
echo .  һ��У�Ե�bios�Ƿ��Ӧ��Ļ��ͣ�����ˢ��bios���������ש������
echo .  ˢbios��������ر��ֻ������ӵ��ԣ�������б�ש���գ�����
echo .
CHOICE /C YN /M "��ȷ��Ҫ������? �Ƿ��Ѿ��Ķ�˵����׼������?! y - Yes, n - No"

IF ERRORLEVEL 2 GOTO End2
IF ERRORLEVEL 1 GOTO Menu1

:Menu1
@adb kill-server
@adb wait-for-device
adb root
Timeout /t 4 >nul
pause

cls


adb push BIOS /data/local/tmp/
adb shell chmod 0777 /data/local/tmp/FPT
adb shell cd /data/local/tmp; ./FPT -Y -F BIOS.bin

echo .
echo .
echo .
echo .
echo .  ���������ر�ƽ����ԣ����ȴ�����30�롣
echo .  ׼����PE U�̸�images U�̣�����hub������ƽ�����
echo .  �̰�����������
echo .  ��ϵͳ�����Զ�����win8��˫ϵͳ������ѡ�����ѡСwin8ͼ��ȷ���Զ�����win8
echo .  ���������в���Ҫ�����κβ���
echo .  ������ɺ�γ�hub
echo .  ǿ�ƹػ���������win8���win8����

:End2
pause
̨��ˢ����ݹ�����.bat 1