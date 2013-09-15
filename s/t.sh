#test
#测试脚本
echo "本程序名：$0(pid:$$)"
echo "一共接收到$#个参数"
echo "所有的参数为：$*"
echo "本目录中脚本如下:"
echo "`ls ~/'Ubuntu One'/shell/*.sh`"
if test $? -eq 0
then echo "执行结果:正常"
else echo "执行结果:失败"
fi
#test
###########################################################################################
#show
#测试文件过滤显示结果
sed -n -e "/^#$1/,/^#$1/p" ~/'Ubuntu One'/shell/shell_test.sh
#show
###########################################################################################
#findstr
#测试字符串查找
strings=$1
location=$2
if [ $# -ne 2 ];then
echo "usage ./findstr.sh your_strings your_directory"
else
for i in `ls $location`
do
cat ${location}/${i}|grep -i $strings > /dev/null
if [ $? -eq 0 ];then
echo "\"$strings\" exists in ${i}"
fi
done
fi
exit 0
### go
### ./findstr.sh your_strings your_directory
#findstr
###########################################################################################
#contain
#测试是否包含字符串，以下结果echo 1
tt=`echo abc_def|grep 123`;echo $tt;test "$tt" = ""
if test $? -eq 1
then echo "包含字符串"
else echo "不包含字符串"
fi
#contain
###########################################################################################
#hasparm
#测试是否包含参数,后来在网上看到一个写法为if [ -z "$1" ]，就是这么简单
echo $#
if test $# -gt 1; then echo "有参数$*" ;else echo "无参数$*"; fi
#hasparm
###########################################################################
#remove_chrome
sudo rm -rf /usr/lib/libXss.so.1
sudo rm -rf /usr/lib/libplds4.so.0d
sudo rm -rf /usr/lib/libplc4.so.0d
sudo rm -rf usr/lib/libnspr4.so.0d
sudo rm -rf /usr/lib/libjpeg.so.62
sudo rm -r /usr/lib/chromeplus-1.3.3.3_ubuntu_debian_i686 
#remove_chrome
