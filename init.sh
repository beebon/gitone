#######################main shell#########################
log()
{
    [ "$?" = "0" ] && echo $1 installed >> ~/tmp/log || echo $1 install failed >> ~/tmp/log;
}
mkdir ~/tmp
touch ~/tmp/log
tt=$1
if [ -z "$1" ]
then tt='all'
fi
sed -n -e "/^#$tt/,/^#$tt/p" ~/'Ubuntu One'/shell/init.sh|sed "/^#$tt/d" >~/'Ubuntu One'/shell/tmp.sh;chmod 777 ~/'Ubuntu One'/shell/tmp.sh
dos2unix ~/'Ubuntu One'/shell/tmp.sh >/dev/null 2>&1
#cat ~/'Ubuntu One'/shell/tmp.sh|less
. tmp.sh `echo $* | sed -e "s/$tt //"`
sleep 1s;rm -f ~/'Ubuntu One'/shell/tmp.sh
cat ~/tmp/log|less
echo "del the tmp directory?(y or n)."
read Keypress 
case "$Keypress" in
 y) rm -rf ~/tmp;;
 *) read -n1 -p "do nothing,ready to exit";;
esac
read -n1 -p "press ctrl+c to break"
exit
#######################end main shell####################
#all

#install dos2unix
#dos2unix
sudo apt-get install dos2unix
[ "$?" = "0" ] && echo dos2unix installed >> ~/tmp/log || echo dos2unix install failed >> ~/tmp/log
#dos2unix

#install psensor
#psensor
sudo apt-get install psensor
[ "$?" = "0" ] && echo psensor installed >> ~/tmp/log || echo psensor install failed >> ~/tmp/log
#psensor

#install chromium flash plugin
#flash
#sudo mkdir ~/tmp;sudo chmod 777 ~/tmp;cd ~/tmp
#wget 'http://get.adobe.com/cn/flashplayer/completion/?installer=Flash_Player_11.2_for_other_Linux_(.tar.gz)_32-bit'
#tar -zxvf install_flash_player_11_linux.i386.tar.gz
#cd install_flash_player_11_linux.i386
#sudo cp -r usr/* /usr
#sudo cp libflashplayer.so /usr/lib/firefox/plugins/
sudo apt-get install flashplugin-installer
[ "$?" = "0" ] && echo flash plugin installed >> ~/tmp/log || echo flash plugin install failed >> ~/tmp/log
#flash

#install wine
#wine
sudo apt-get install wine
echo 'please click ja when install vcredist package'
#wine env for qq and taobao
winetricks riched20 riched30 ie8 vcrun6 msls31 msxml6 vcrun2005 vcrun2008 winhttp dotnet20
d1=$HOME/.cache/winetricks/gdiplus
d2=$HOME/.cache/winetricks/flash11
sudo mkdir -p $d1
sudo mkdir -p $d2
#cd $d2
echo '请右键打开此链接下载install_flash_player_ax_32bit.exe:http://get.adobe.com/cn/flashplayer/completion/?installer=Flash_Player_11_for_Internet_Explorer ,并将其保存到~/.cache/winetricks/flash11中,完成后请自行到该目录进行安装并按任意键继续'
xdg-open 'http://112.5.187.67/0/ishare.down.sina.com.cn/24478521.exe?ssig=Ge4r8RhV7h&Expires=1379001600&KID=sina,ishare&ip=1378893897,221.175.8.&fn=install_flash_player_ax_32bit.exe' >/dev/null
nautilus $d2
read keypress
#cd $d1
echo '请右键打开此链接下载NDP1.0sp2-KB830348-X86-Enu.exe:http://download.cnet.com/NET-Framework-1-0-GDIPLUS-DLL-Security-Update/3000-10250_4-10732223.html 并将其保存到~/.cache/winetricks/gdiplus>中，完成后按任意键继续'
xdg-open 'http://download.cnet.com/NET-Framework-1-0-GDIPLUS-DLL-Security-Update/3000-10250_4-10732223.html' >/dev/null
nautilus $d1
read keypress
#winetricks flash11
winetricks gdiplus
[ "$?" = "0" ] && echo wine installed >> ~/tmp/log || echo wine install failed >> ~/tmp/log
#将exe关联到wine,使exe可直接双击运行
cont_to_add='application/x-ms-dos-executable=wine.desktop'
line_num=1 #指明插入到第1行后
sed -i "$line_num a\\$cont_to_add" ~/.local/share/applications/mimeapps.list
#wine

#install qq
#qq
cd ~/tmp
wget 'http://softdl1.tech.qq.com/soft/21/QQ2012Beta3-20120810.exe' -O qq.exe -d softdl1.tech.qq.com -U 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/28.0.1500.71 Chrome/28.0.1500.71 Safari/537.36'
echo 若无法自动下载请到此页面http://softdl1.tech.qq.com/soft/21/QQ2012Beta3-20120810.exe下载并存到~/tmp/qq.exe,下载完成后按任意键进行安装
read keypress
nautilus .
#qq

#install node
#node
sudo apt-get install nodejs
[ "$?" = "0" ] && echo nodejs installed >> ~/tmp/log || echo nodejs installed failed >> ~/tmp/log
sudo apt-get install npm
[ "$?" = "0" ] && echo npm installed >> ~/tmp/log || echo npm install failed >> ~/tmp/log
ln -s /usr/bin/nodejs /usr/bin/node #解决一些npm插件无法执行问题，如phonegap
#node

#install node-webkit
#webkit
npm install node-webkit
[ "$?" = "0" ] && echo node-webkit installed >> ~/tmp/log || echo node-webkit install failed >> ~/tmp/log
#webkit

#install mongo
#mongo
sudo apt-get install mongodb
[ "$?" = "0" ] && echo mongo installed >> ~/tmp/log || echo mongo install failed >> ~/tmp/log
#start mongo
sudo mongod --dbpath /var/lib/mongodb/ --logpath /var/log/mongodb/mongodb.log --logappend &
[ "$?" = "0" ] && echo mongodb server started >> ~/tmp/log || echo mongodb server start failed >> ~/tmp/log
#mongo

#install vim
#vim
sudo apt-get install vim
[ "$?" = "0" ] && echo vim installed >> ~/tmp/log || echo vim install failed >> ~/tmp/log
#winmanager
cd ~/tmp
mkdir winmanager;cd winmanager
wget http://www.vim.org/scripts/download_script.php?src_id=754 -O winmanager.zip
unzip winmanager.zip
rm winmanager.zip;cd ..
sudo cp -rf winmanager/* /usr/share/vim/vim73/
[ "$?" = "0" ] && echo winmanager for vim installed and configed >> ~/tmp/log || echo winmanager for vim install failed >> ~/tmp/log
sudo vim -c "helptags /usr/share/vim/vim73/doc" -c "q"
sudo chmod 777 /etc/vim/vimrc
echo '"my_custom_setting' >> /etc/vim/vimrc
echo 'let g:winManagerWindowLayout = "FileExplorer"' >> /etc/vim/vimrc
echo 'map <c-w><c-f> :FirstExplorerWindow<cr>' >> /etc/vim/vimrc
echo 'map <c-w><c-b> :BottomExplorerWindow<cr>' >> /etc/vim/vimrc
echo 'map <c-w><c-t> :WMToggle<cr>' >> /etc/vim/vimrc
echo '"set nu' >> /etc/vim/vimrc
echo 'set tabstop=2' >> /etc/vim/vimrc
echo 'set shiftwidth=2' >> /etc/vim/vimrc
echo '"set swap direction'>> /etc/vim/vimrc
echo 'set bdir-=.'>> /etc/vim/vimrc
echo 'set backupdir+=$TEMP//'>> /etc/vim/vimrc
echo 'set dir-=.'>> /etc/vim/vimrc
echo 'set directory+=$TEMP//'>> /etc/vim/vimrc
sudo chmod 544 /etc/vim/vimrc
[ "$?" = "0" ] && echo vimrc configed >> ~/tmp/log || echo vimrc config failed >> ~/tmp/log
#vim

#install git
#git
sudo apt-get install git
[ "$?" = "0" ] && echo dos2unix installed >> ~/tmp/log || echo git install failed >> ~/tmp/log
echo please enter your username:
read Keypress
git config --global user.name $keypress;sleep 1;git config --global github.user $keypress
echo please enter your email:
read keypress
git config --global user.email "$keypress"
echo please enter your token:
read keypress
git config --global github.token $keypress 
echo please enter your git resp name:
read keypress
git config remote.origin.url https://github.com/beebon/$keypress.git
[ "$?" = "0" ] && echo git configed >> ~/tmp/log || echo git config failed >> ~/tmp/log
#set ubuntu one as git resp
u gitone
[ "$?" = "0" ] && echo gitone set >> ~/tmp/log || echo gitone set failed >> ~/tmp/log
#git

#install mono
#mono
sudo apt-get install monodevelop
[ "$?" = "0" ] && echo mono installed >> ~/tmp/log || echo mono install failed >> ~/tmp/log
sudo apt-get install mono-xsp4
[ "$?" = "0" ] && echo mono-xsp4 installed >> ~/tmp/log || echo mono-xsp4 install failed >> ~/tmp/log
#mono

#install jexus
#jexus
cd ~/tmp
wget wget http://www.linuxdot.net/down/jexus-5.4.3.tar.gz
tar -zxvf jexus-5.4.3.tar.gz 
cd jexus-5.4.3 
sudo ./install
cd /usr/jexus
sudo ./jws regsvr
sudo ./jws start
[ "$?" = "0" ] && echo jexus installed and server started >> ~/tmp/log || echo jexus install failed >> ~/tmp/log
echo do you want to open jexus test page?(y for yes)
read keypress
[ "$keypress" = "y" ] && firefox http://localhost/info
#jexus

#phonegap
sudo npm install -gf phonegap #需要加上f这个强制安装参数
#安装android sdk
cd ~/Downloads
wget http://dl.google.com/android/android-sdk_r22.2-linux.tgz
tar -zxvf android-sdk_22.2-linux.tgz
#上面的sdk only包似乎少了些东西，只好又下载adt bundle,该包含有eclipse等相关工具，可只使用其android sdk部分即可
wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-20130911.zip
unzip adt-bundle-linux-x86_64-20130911.zip
mv -rf adt-bundle-linux-x86_64-20130911/sdk android-sdk_22.2-linux
#export PATH=${PATH}:/home/beebon/Downloads/android-sdk-linux/tools
#需升级nodejs,从apt-get安装的仅为0.6的版本，需0.8以上方可正常运行,下载当前最新版并编绎安装
wget http://nodejs.org/dist/v0.10.18/node-v0.10.18.tar.gz -O nodejs.tar.gz
tar -xvzf nodejs.tar.gz
make
sudo make install
#安装ant和jdk7
sudo apt-get install ant
sudo apt-get install openjdk-7-jdk
#手动配置环境变量（或者确保上述下载包解压路径与该配置一致即可）
echo export ANDROID_HOME=/home/beebon/Downloads/adt-bundle-linux-x86_64-20130911/sdk >> ~/.bashrc
echo export PATH=$PATH:$ANDROID_HOME/tools >> ~/.bashrc
echo export PATH=$PATH:$ANDROID_HOME/platform-tools >> ~/.bashrc
echo export PATH=$PATH:$ANDROID_HOME/build-tools >> ~/.bashrc
#echo export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386/jre >> ~/.bashrc
#echo export PATH=$PATH:$JAVA_HOME/bin >> ~/.bashrc
ehco '将打开android sdk manager,请到菜单，选项中配置代理210.101.131.231:8080,并勾选强制使用http连接选项，可参考http://my.oschina.net/sxq0714/blog/52538 建议使用japan or korea的代理'
android
#phonegap
#all
