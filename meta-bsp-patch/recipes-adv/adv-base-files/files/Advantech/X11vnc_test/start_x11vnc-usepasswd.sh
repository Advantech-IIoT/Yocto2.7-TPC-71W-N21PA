#!/bin/bash

export DISPLAY=:0
HISTORY=$(cd `dirname $0`; pwd)
LOGPATH=$HISTORY/x11vnc-start.log

killprocess()
{
	PID=`ps aux |grep "$1" |grep -v grep |grep -v start_x11vnc.sh`

	if [ "x$PID" = "x" ]; then
		echo "$1 not process!" >> $LOGPATH
	else
		PID=`echo $PID |awk -F ' ' '{print $2}'`
		echo "kill $1 now" >> $LOGPATH
		kill -9 $PID
	fi
}

killprocess x11vnc

if [ ! -d /var/run/lightdm/root/ ]; then
	# If this is yocto filesystem.
	CMDLINE=`cat /proc/cmdline |grep com1-485`
	if [ "x$CMDLINE" = "x" ]; then
		echo "Start with com1-232/dbg mode." > $LOGPATH
	else
		echo "Start with com1-485 mode, need to restart Xorg server." > $LOGPATH
		killprocess matchbox-window-manager
		killprocess matchbox-desktop
		killprocess matchbox-panel
		killprocess matchbox-keyboard
		killprocess "/usr/bin/Xorg :0 -br -pn -nolisten tcp +iglx"
		killprocess "Xorg"
		sleep 1

		Xorg &
		matchbox-window-manager -theme Sato -use_desktop_mode decorated -use_cursor yes &
		matchbox-desktop &
		matchbox-panel --titlebar --start-applets showdesktop,windowselector --end-applets clock,battery,keyboard,systray,startup-notify,notify &
		matchbox-keyboard -d &
		sleep 1
	fi
fi

echo "##############################################" >> $LOGPATH
ps aux |grep Xorg |grep -v grep >> $LOGPATH
ps aux |grep box |grep -v grep >> $LOGPATH
echo "##############################################" >> $LOGPATH
echo "Start x11vnc server..." >> $LOGPATH

if [ ! -d /var/run/lightdm/root/ ]; then
	# If this is yocto filesystem.
	#x11vnc -ncache 10 -forever -shared -capslock -rfbport 5900 -rawfb console >> $LOGPATH &
	x11vnc -ncache 10 -forever -shared -capslock -rfbport 5900 -rfbauth /etc/x11vnc.pass >> $LOGPATH &
else
	# If this is ubuntu filesystem.
	x11vnc -ncache 10 -forever -shared -capslock -rfbport 5900 -rfbauth /etc/x11vnc.pass -auth /var/run/lightdm/root/:0 -display :0 >> $LOGPATH &
fi

sync
exit
