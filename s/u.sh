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
grep -R --include="*.*" $1 "$PWD"
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
*)
  echo 'deault=~/.bashrc'
  echo 'parms desription:1=/etc/profile,2=~/.bash_profile,3=/etc/rc.local';;
esac
sudo vim $BASHRC
#conf
#####################将UBUNTUONE设为数据仓库############
##########详见https://help.github.com/articles/create-a-repo########
#############参考https://gist.github.com/colwilson/1629349##########
#gitone
#if [ -z "$1"] then echo "缺少git项目名称";exit fi
cd ~/'Ubuntu One'/shell
git init --bare
git add .
git commit -am 'fisrt commit shell'
git remote add orgin https://github.com/beebon/gitone.git
git push origin master
#gitone
