#用于执行s/t中测试文本段的执行脚本，如t test将执行shell_test中#test包含的脚本部分
#将段落加载到临时文件tmp.sh中
tt=$1
sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/s/t.sh|sed "/^#$tt/d" >~/'Ubuntu One'/shell/tmp.sh;chmod 777 ~/'Ubuntu One'/shell/tmp.sh
#sed -i 's/^M//' ~/'Ubuntu One'/shell/tmp.sh
dos2unix ~/'Ubuntu One'/shell/tmp.sh >/dev/null 2>&1
#sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/shell_test.sh > ~/'Ubuntu One'/shell/tmp.sh;chmod 777 ~/'Ubuntu One'/shell/tmp.sh
. tmp.sh `echo $* | sed -e "s/$tt //"`
sleep 1s;rm -f ~/'Ubuntu One'/shell/tmp.sh



