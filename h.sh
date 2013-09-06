#用于执行s/h中测试文本段的执行脚本，如h vim将执行project中#vim包含的脚本部分
tt=$1
sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/s/h.sh|sed "/^#$tt/d"|less




