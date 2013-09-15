#kill
#杀死指定名称的进程，如kill firefox
kill -9 `ps ax|grep $1|grep -v grep|awk '{print $1}'`
#kill
############################################################
#pak
#pack or unpack the chrome pak file by nodejs
#echo "调用路径：${0%/*}" #测试回显被调用脚本所在路径
case $1 in
p)
  nodejs "${0%/*}/s/chromepak.js" pack "$2" "$3.pak";;
u)
  nodejs "${0%/*}/s/chromepak.js" unpack "$2.pak" "$3";;
r)
  nodejs "${0%/*}/s/chromepak.js" replace "$2.pak" "$3" "$4";;
*)
  ehco 'error:please give an parm in p,u or r';;
esac
#pak
############################################################
#chrome
echo $*
if test $* = "chrome";then chromium-browser;else chromium-browser $1;fi
#chrome
############################################################
#jexus
cd /usr/jexus
#sudo ./jws regsvr
sudo ./jws restart
u chrome http://localhost/info
#jexus
###########################################################
#find
grep -R --color=always --include="*.*" $1 "$PWD"
#find
##########################################################
#conf
BASHRC=~/.bashrc
case $1 in
1)
  BASHRC=/etc/profile;;
2)
  BASHRC=~/.bash_profile;;
3)
  BASHRC=/etc/rc.local;;
4)
  BASHRC=/root/.bashrc;;
5)
  BASHRC=/boot/grub/grub.cfg;;
*)
  echo 'deault=~/.bashrc'
  echo 'parms desription:1=/etc/profile,2=~/.bash_profile,3=/etc/rc.local'
  echo '4=/root/.bashrc,5=/boot/grub/grub.cfg';;
esac
sudo vim $BASHRC
#conf
#####################将UBUNTUONE设为数据仓库############
##########详见https://help.github.com/articles/create-a-repo########
#############参考https://gist.github.com/colwilson/1629349##########
#gitone
#if [ -z "$1"] then echo "缺少git项目名称";exit fi
cd ~/'Ubuntu One'/shell
if [ -n "$1" ]
then git init --bare;git add .
else git add -i
fi
git commit -am 'fisrt commit shell'
git remote add origin https://github.com/beebon/gitone.git
git push -u origin master -f #force push
#gitone
#commitone
cd ~/'Ubuntu One'/shell
if [ -z "$1" ]
then echo 'commit remark required';exit
fi
if [ -z "$2" ]
then git add .
else git add -i #交互模式
fi
git commit -am "$1"
git remote add origin https://github.com/beebon/gitone.git
git push -u origin master -f #force push
#commitone

###########look for specified file to remove#########################
#f2d
find . -name "$1"  | xargs rm -rf
#f2d

###########look for specified file to remove(by exclude certain name)#######
#ef2d
find ! -name "$1" ! -name '.'|xargs rm -rf
#ef2d

##########start app by wine#############
#win
DIRE=~/.wine/drive_c/Program*/Tencent/QQ/Bin/QQ.exe
case $1 in
1)
  DIRE=~/.wine/drive_c/Program*/AliWangWang/AliIM.exe;;
2)
  DIRE=~/.wine/drive_c/Program*/Tencent/QQ/Bin/QQ.exe;;
3)
  DIRE=/media/beebon/WIN7/Users/Administrator/AppData/Local/MapleStudio/ChromePlus/Application/chrome.exe;;
4)
  DIRE=root/.bashrc;;
5)
  DIRE=/boot/grub/grub.cfg;;
*)
  echo 'deault=QQ.exe,1=AliIM.exe,2=qq.exe,3=chrome.exe';;
esac
[ "$2" = "" ] && WINEDEBUG=-all $DIRE || wine $DIRE
#win

###########create a desktop shortcup#############
#lk
time=`date +%M%S`
filename=~/Desktop/$time.desktop
echo '[Desktop Entry]' >> $filename
echo Type=Application>> $filename
echo Terminal=true>> $filename
echo Name=MyAppShortcut>> $filename
echo Icon=$HOME/icon.svg>> $filename
echo Exec=sh $HOME/test.sh>> $filename
echo 创建完毕，请到桌面右键编辑详细属性(注意勾选允许可执行) 
echo 链接的脚本应尽可能简单，目前测试在链接的脚本继续调用其他脚本会出错，若执行一些简单的如wine /somepath/***.exe则可正常执行
#lk
