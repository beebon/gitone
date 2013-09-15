#!/bin/bash
#初始化自定义配置，使Ubuntu One/shell中自定义脚本可像命令一样执行
#根据参数选定要写入的配置文件，1＝所有用户登录时启动，2＝在用户登录时启动，默认为在打开shell时启动,详细参考http://www.cnblogs.com/myitm/archive/2011/10/16/2214448.html
BASHRC=~/.bashrc
case $1 in
1)
  BASHRC=/etc/profile;;
2)
  BASHRC=~/.bash_profile;;
*)
  echo 'error:please give an parm in 1 or 2';;
esac
echo "bash=$BASHRC"

#清除原有内容并重新写入,-i表示过滤后写入到文件
sed -i '/^#custom_config_start/,/^#custom_config_end/d' $BASHRC
rm -f ~/'Ubuntu One'/shell/*.sh~
#开始写入
echo '#custom_config_start' >> $BASHRC
#echo 'mysh="cd ~/'Ubuntu One'/shell' >> $BASHRC
echo "export PATH=\$PATH:'~/Ubuntu One'/shell:/usr/lib/node-webkit-v0.7.2-linux-ia32:/usr/lib/chromeplus-1.3.3.3_ubuntu_debian_i686" >> $BASHRC
echo "chmod 764 ~/'Ubuntu One'/shell/*.sh" >> $BASHRC
chmod 764 ~/'Ubuntu One'/shell/*.sh
#make sh alias
echo '#custom alias' >> $BASHRC
arr=`ls ~/'Ubuntu One'/shell/`
#echo "成功导入了如下命令："
#echo "$arr"
#[[ "${item/'.sh'/}" != "$item" ]] && echo "include .sh" || echo "not"
for item in $arr;do [[ "${item/'.sh'/}" != "$item" ]] && echo "alias ${item%.*}='. $item'">>$BASHRC;done
#for item in $arr;do echo "alias ${item%.*}='. $item'">>$BASHRC;done
echo '#custom_config_end' >> $BASHRC
#使配置生效
sleep 1s
. $BASHRC
#reset

