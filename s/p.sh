###############打开sport node端服务##########################
#sport
nodejs '/media/beebon/9C4C1FA94C1F7D68/MyJob/sport/04code/Server/ExpressSite/server.js'
#sport
###############原WINDOWS mongo数据库迁移######################
#copy_mongo
#将windows下的数据库复制到linux中
#chmod 777 /var/lib/mongodb
cp '/media/beebon/B484183A8417FE14/Program Files/mongodb-win32-i386-2.4.5/data/db/local.0' /var/lib/mongodb/
cp '/media/beebon/B484183A8417FE14/Program Files/mongodb-win32-i386-2.4.5/data/db/local.ns' /var/lib/mongodb/
chmod 755 /var/lib/mongodb
#copy_mongo
################安装配置node环境#############################
#install_node
#安装nodejs环境，包括nodejs、npm、mongodb及相关启动项设置
#install nodejs
sudo apt-get install nodejs
#install npm
sudo apt-get install npm
# install mongodb
sudo apt-get install mongodb
#注册mongo服务(嵌套脚本)
#reg_mongo
#cd /usr/bin
# --dbpath：指定mongo的数据库文件夹--logpath：指定mongo的log日志文件名--logappend：表示log的写入是采用附加的方式，默认的是覆盖之前的文件
#echo bee | sudo -S mongod --dbpath /var/lib/mongodb/ --logpath /var/log/mongodb/mongodb.log --logappend &
sudo mongod --dbpath /var/lib/mongodb/ --logpath /var/log/mongodb/mongodb.log --logappend &
#reg_mongo
#install_node
###################以webkit运行webapp##############################
#webkit_node
#zip -d ~/Documents/mywork/WebApp.nw ~/Documents/mywork/WebApp/* 
nw ~/Documents/mywork/WebApp/
#nw ~/Documents/mywork/WebApp.nw
#webkit_node
################解压chrome.pak包(测试无效)#########################
#pak
u.sh pak u /usr/lib/chromium-browser/chrome ~/Documents/tmp
#pak
#################用vim打开指定项目#################################
#vim
case $1 in
ext)
  cd ~/Documents/MyExt;vim -c ":WMToggle";;
shell)
  cd ~/'Ubuntu One'/shell;vim -c ":WMToggle";;
work)
  cd ~/Documents/mywork;vim -c "WMToggle";;
app)
  cd /media/beebon/9C4C1FA94C1F7D68/node-webkit-v0.7.1-win-ia32/WebApp;vim -c ":WMToggle";;
srv)
  cd /media/beebon/9C4C1FA94C1F7D68/MyJob/sport/04code/Server/ExpressSite;vim -c ":WMToggle";;
*)
  vim -c ":WMToggle";;
esac
#vim
##################显示指定目录内容################################
#dir
case $1 in
ext)
  cd ~/Documents/MyExt;dir;;
shell)
  cd ~/'Ubuntu One'/shell;dir;;
work)
  cd ~/Documents/mywork;dir;;
srv)
 sudo mkdir /media/beebon/9C4C1FA94C1F7D68;sudo mount /dev/sda6 /media/beebon/9C4C1FA94C1F7D68;cd /media/beebon/9C4C1FA94C1F7D68/MyJob/sport/04code/Server/ExpressSite;dir;;
napp)
 sudo mkdir /media/beebon/9C4C1FA94C1F7D68;sudo mount /dev/sda6 /media/beebon/9C4C1FA94C1F7D68;cd /media/beebon/9C4C1FA94C1F7D68/node-webkit-v0.7.1-win-ia32/WebApp;dir;; 
app)
 sudo mkdir /media/beebon/9C4C1FA94C1F7D68;sudo mount /dev/sda6 /media/beebon/9C4C1FA94C1F7D68;cd /media/beebon/9C4C1FA94C1F7D68/MyJob/sport/04code/Client/WebApp;dir;;
*)
  cd ~/;dir;;
esac
#dir
######################chrome打开指定网址################################
#chrome
case $1 in
srv)
  chromium-browser http://localhost:8090;dir;;
app)
  chromium-browser /media/beebon/9C4C1FA94C1F7D68/node-webkit-v0.7.1-win-ia32/WebApp/Index.html;;
*)
  cd ~/;dir;;
esac
#chrome
#######################安装Node.VaSH##############################
#vash
sudo mkdir ~/Documents/git
cd ~/Documents/git
sudo git clone --recursive git@github.com:G33kLabs/Node.VaSH.git
cd Node.Vash
sudo npm update
#vash
##########################################################
#conf
CONF=~/.bashrc
case $1 in
1)
  CONF=/usr/jexus/siteconf/default;;
2)
  CONF=/etc/vim/vimrc;;
*)
  echo 'deault=~/.bashrc'
  echo 'parms desription:1=jexus default,2=vim';;
esac
sudo vim $CONF
#conf
##########################################################
#start
case $1 in
1)
	cd /usr/jexus
	#sudo ./jws regsvr
	sudo ./jws restart;;
	#u chrome http://localhost/info
*)
  echo 'parms desription:1=jexus';;
esac
#start


