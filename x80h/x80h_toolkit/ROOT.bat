echo off
@adb kill-server
cls
echo .  将要进行root获取权限...
echo .  请确保平板已经打开USB调试并连接电脑
echo .
@adb wait-for-device

adb root
cls
echo .
Timeout /t 5 >null

adb shell id
echo .
echo .  If ID above - 0/root, Everything will goes well.
echo .  If otherwise, press CTRL + C to cancel.
pause

cls
echo Downloading BUSYBOX
@wget -c busybox.net/downloads/binaries/latest/busybox-i586 -O .\root\system\xbin\busybox
echo .
echo .
echo .  清除 system ...
adb shell mount -o rw,remount /system
adb shell rm -f /system/bin/su
adb shell rm -f /system/xbin/su
adb shell rm -f /system/xbin/daemonsu
adb shell rm -f /system/bin/.ext/.su
adb shell rm -f /system/etc/install-recovery.sh
adb shell rm -f /system/etc/init.d/99SuperSUDaemon
adb shell rm -f /system/etc/.installed_su_daemon
adb shell rm -f /system/app/Superuser.apk
adb shell rm -f /system/app/Superuser.odex
adb shell rm -f /system/app/SuperUser.apk
adb shell rm -f /system/app/SuperUser.odex
adb shell rm -f /system/app/superuser.apk
adb shell rm -f /system/app/superuser.odex
adb shell rm -f /system/app/Supersu.apk
adb shell rm -f /system/app/Supersu.odex
adb shell rm -f /system/app/SuperSU.apk
adb shell rm -f /system/app/SuperSU.odex
adb shell rm -f /system/app/supersu.apk
adb shell rm -f /system/app/supersu.odex
adb shell rm -f /data/dalvik-cache/*com.noshufou.android.su*
adb shell rm -f /data/dalvik-cache/*com.koushikdutta.superuser*
adb shell rm -f /data/dalvik-cache/*com.mgyun.shua.su*
adb shell rm -f /data/dalvik-cache/*Superuser.apk*
adb shell rm -f /data/dalvik-cache/*SuperUser.apk*
adb shell rm -f /data/dalvik-cache/*superuser.apk*
adb shell rm -f /data/dalvik-cache/*eu.chainfire.supersu*
adb shell rm -f /data/dalvik-cache/*Supersu.apk*
adb shell rm -f /data/dalvik-cache/*SuperSU.apk*
adb shell rm -f /data/dalvik-cache/*supersu.apk*
adb shell rm -f /data/dalvik-cache/*.oat
adb shell rm -f /data/app/com.noshufou.android.su-*
adb shell rm -f /data/app/com.koushikdutta.superuser-*
adb shell rm -f /data/app/com.mgyun.shua.su-*
adb shell rm -f /data/app/eu.chainfire.supersu-*
echo .
echo .
echo .  发送文件 ...
adb push root /data/local/tmp/ > null
echo .
echo .
echo .  复制文件进入system ...
adb shell mkdir /system/bin/.ext >null
adb shell mkdir /system/etc/init.d >null
adb shell cp /data/local/tmp/system/xbin/su /system/xbin/daemonsu
adb shell cp /data/local/tmp/system/xbin/su /system/xbin/su
adb shell cp /data/local/tmp/system/xbin/su /system/bin/.ext/.su
adb shell cp /data/local/tmp/system/app/Superuser.apk /system/app/Superuser.apk
adb shell cp /data/local/tmp/system/app/install-recovery.sh /system/etc/install-recovery.sh
adb shell cp /data/local/tmp/system/app/99SuperSUDaemon /system/etc/init.d/99SuperSUDaemon
adb shell cp /data/local/tmp/system/xbin/busybox /system/xbin/
adb shell /system/xbin/busybox touch /system/etc/.installed_su_daemon
rem adb shell echo 1 >> /system/etc/.installed_su_daemon

echo .
echo .
echo .  设定权限 ...
adb shell chown root.root /system/bin/.ext
adb shell chown root.root /system/bin/.ext/.su
adb shell chown root.root /system/xbin/su
adb shell chown root.root /system/xbin/daemonsu
adb shell chown root.root /system/etc/install-recovery.sh
adb shell chown root.root /system/etc/init.d/99SuperSUDaemon
adb shell chown root.root /system/etc/.installed_su_daemon
adb shell chown root.root /system/app/Superuser.apk
adb shell chown root.root /system/xbin/busybox

adb shell chmod 0777 /system/bin/.ext
adb shell chmod 06755 /system/bin/.ext/.su
adb shell chmod 06755 /system/xbin/su
adb shell chmod 0755 /system/xbin/daemonsu
adb shell chmod 0755 /system/etc/install-recovery.sh
adb shell chmod 0755 /system/etc/init.d/99SuperSUDaemon
adb shell chmod 0644 /system/etc/.installed_su_daemon
adb shell chmod 0644 /system/app/Superuser.apk
adb shell chmod 0755 /system/xbin/busybox

adb shell /system/xbin/su --install
adb shell /system/xbin/busybox --install -s /system/xbin
echo .
echo .
echo .  请等待...正在完成进程
adb shell rm -fR data/local/tmp/system/
echo .
echo .
echo .  恭喜你，已经成功root了！！！

echo .  现在平板将进行重启
pause
adb reboot


台电刷机便捷工具箱.bat 1