color 11
echo off
:Menu
cls
echo .
echo .
echo .			☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
echo .			☆       台电刷机便捷工具箱     ☆
echo .			☆    http://bbs.teclast.com    ☆
echo .			☆            龙韶轩            ☆
echo .			☆         2014.12.31           ☆
echo .			☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
echo .		请先确定 :
echo .		- 机器电量是否大于50%  如果电量不足建议先充电!!!
echo .		- 平板是否连接到电脑
echo .		- 依次进入平板的设置--开发者选项下，勾选usb调试
echo .
echo .		1)进入fastboot线刷安卓（卡10%%专用，双系统单刷安卓要选2！！！）
echo .		2)进入fastboot线刷安卓（双系统单刷安卓卡10%%专用）
echo .		3)进行ROOT
echo .		4)刷BIOS
echo .
echo .
CHOICE /C 1234 /M "选择输入 1-4 或者 Q - 退出."

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