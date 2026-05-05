#!/bin/dash

echo "----------------++++"
echo " beegui"
echo "----------------++++"
echo
echo "GitHub:https://github.com/rebangkkuser/beeOS"

echo "[beegui] To start the X11 graphical server, you need to exit your current BeeOS session."
echo "[beegui] Start it from Termux before logging back in."
echo
echo "[beegui] You can use:"
echo "termux-x11 :0 &"
echo "or"
echo "vncserver :1"
echo

printf "[beegui] Continue and launch XFCE? [y/n]: "
read ans

case "$ans" in
  y|Y)
    echo "[beegui] Starting XFCE..."
    export DISPLAY=:0
    startxfce4
    ;;
  *)
    echo "[beegui] Cancelled."
    exit 0
    ;;
esac
