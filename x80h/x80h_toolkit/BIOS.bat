echo off
cls
echo .
echo .  注意！将要进行的是刷入bios操作...
echo .  提前将机器对应的bios文件（即xxx.bin）放入bios文件夹中并改名BIOS.bin
echo .  一定校对的bios是否对应你的机型，否则刷错bios机器将会变砖！！！
echo .  刷bios过程中务必保持机器连接电脑，否则会有变砖风险！！！
echo .
CHOICE /C YN /M "你确定要继续吗? 是否已经阅读说明并准备好了?! y - Yes, n - No"

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
echo .  现在正常关闭平板电脑，并等待至少30秒。
echo .  准备好PE U盘跟images U盘，接入hub并连接平板电脑
echo .  短按开机键开机
echo .  单系统机型自动引导win8，双系统机型在选择界面选小win8图标确定自动引导win8
echo .  引导过程中不需要进行任何操作
echo .  引导完成后拔出hub
echo .  强制关机重启进入win8完成win8配置

:End2
pause
台电刷机便捷工具箱.bat 1