echo off
cls
echo .
echo. 刷机将清除平板数据，请提前做好备份...
echo. 确保平板电脑已经连接到你的电脑...
echo. 刷机过程中不要关闭平板电脑...
echo .
CHOICE /C YN /M "准备好了?你确定要继续吗? Y - 准备好了, N - 还没准备好"

IF ERRORLEVEL 2 GOTO End1
IF ERRORLEVEL 1 GOTO Flash

:Flash
CLS
IF EXIST droidboot.img (
echo .
echo .  你的平板将重启进入fastboot模式...
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
echo 设备 %MYVAR% 已经连上...现在开始...
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
echo .  很好，一切进展顺利...
echo .  你的平板将启动进入安卓...
echo .
fastboot continue
echo .

) else echo .  设备没有找到...再试一次...
) else echo .  固件文件没有找到，请确保固件文件已经下载并放在指定路径...
goto End1


:End1
echo .
echo .  按任意键返回主菜单...
pause > nul
台电刷机便捷工具箱.bat 1
