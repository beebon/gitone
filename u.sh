#用于执行s/u中测试文本段的执行脚本，如u kill firefox将执行util中#kill包含的脚本部分
#将段落加载到临时文件tmp.sh中
tt=$1
sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/s/u.sh|sed "/^#$tt/d" >~/'Ubuntu One'/shell/tmp.sh;chmod 777 ~/'Ubuntu One'/shell/tmp.sh
#cat ~/'Ubuntu One'/shell/tmp.sh
#sed -i 's/^M//' ~/'Ubuntu One'/shell/tmp.sh
dos2unix ~/'Ubuntu One'/shell/tmp.sh >/dev/null 2>&1
#sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/project.sh > ~/'Ubuntu One'/shell/tmp.sh;chmod 777 ~/'Ubuntu One'/shell/tmp.sh
. tmp.sh `echo $* | sed -e "s/$tt //"`
sleep 1s;rm -f ~/'Ubuntu One'/shell/tmp.sh




