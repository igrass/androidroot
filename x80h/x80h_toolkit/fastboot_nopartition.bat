echo off
cls
echo .
echo. 刷机将清除平板数据，请提前做好备份...
echo. 确保平板电脑已经连接到你的电脑...
echo. 刷机过程中不要关闭平板电脑...
echo .
CHOICE /C YN /M "准备好了?你确定要继续吗? Y - 准备好了, N - 还没准备好"

IF ERRORLEVEL 2 GOTO End2
IF ERRORLEVEL 1 GOTO Flash

:Flash
CLS
IF EXIST droidboot.img (
@adb wait-for-device
adb reboot bootloader
echo .
echo .  你的平板将关机，出现电池标志后开机进入fastboot模式
echo .
echo .  开机进入fastboot模式
echo .
) else echo .  设备没有找到...再试一次...
goto End1

:End1
echo .
echo .  按任意键继续...
pause > nul
2fastboot.bat 1


:End2
echo .
echo .  按任意键继续...
pause > nul
台电刷机便捷工具箱.bat 1
