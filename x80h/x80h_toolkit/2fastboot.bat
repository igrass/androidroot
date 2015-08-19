echo off
cls
echo .
echo .
echo 设备 %MYVAR% 已经连上...现在开始双系统单刷安卓...
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
echo .  很好，一切进展顺利...
echo .  你的平板将启动进入安卓...
echo .
fastboot continue
echo .
goto End1


:End1
echo .
echo .  按任意键返回主菜单...
pause > nul
台电刷机便捷工具箱.bat 1

echo .
echo .
@fastboot flash system system.img
echo .
echo .
echo .  很好，一切进展顺利...
echo .  请将平板开机进入安卓...
echo .
fastboot continue
echo .
