                                                    UBUNTU13.04常用设置

#wubi
＊基于IBUS的五笔设置:
  1.ctrl+alt+t打开终端，输入sudo apt-get install ibus-table-wubi
  2.重启IBUS后重新配置IBUS首选项，设置输入法为五笔，并将原来的输入法删除（拼音及台式输入法）
  相关链接：http://wiki.ubuntu.org.cn/IBus#.E5.AE.89.E8.A3.85.E4.BA.94.E7.AC.94.E5.BC.95.E6.93.8E.EF.BC.9A

*chromium flash插件安装：
  下载tar.gz的就可以了，解压后打开控制台，cd到解压后目录，执行
  sudo cp -r usr/* /usr
  sudo cp libflashplayer.so /usr/lib/firefox/plugins/
  弄完两个浏览器就支持flash了
#wubi

#shortcut
桌面快捷运行shell脚本代码如下,一般修改后三项即可
[Desktop Entry]
Type=Application
Terminal=true
Name=MyAppShortcut
Icon=/path/to/icon/icon.svg
Exec=/path/to/file/mount-unmount.sh

关于wine的桌面快捷，请执行h wine查看
#shortcut

#wine
关于wine的用法经过实测一般原windows系统里的程序都可直接通过wine "the_app_path"来运行，也可直接在ubuntu下制作桌面快捷方式直接打开，不过通过终端打开较稳定，以下给出一个创建桌面快捷的代码：
[Desktop Entry]
Name=腾讯QQ
Exec=env WINEPREFIX="/home/beebon/.wine" winedbg C:\\\\Program\\ Files\\\\Tencent\\\\QQ\\\\Bin\\\\QQ.exe 
Type=Application
StartupNotify=true
Path=/home/beebon/.wine/dosdevices/c:/Program Files/Tencent/QQ/Bin/
Icon=6CA2_NewShortcut311_0951773981FA4AB2BC21B7DCEC95892A.

上述代码通过文本编辑器存为Name.desktop即可。
注：你也可以直接在ubuntu上执行安装包，不过建议如果可以用原WINDOWS系统的程序则最好，也可以最小的占用硬盘资源。
#wine

#qq
＊qq安装
参考：http://www.2cto.com/os/201207/144253.html
需要安装wine,这里如果安装完成后程序无法运行，可以将桌面上生成的快捷方式用文本编辑器打开，编辑第二行Exec部分，将wine替换为winedbg,保存修改后直接拖放到终端，就可以跟踪到程序运行的错误在哪，方便用户解决问题所在，如安装淘宝时发现字库出了问题，需要从windows将相应的字库拷到ubuntu的wine环境中,进一步也可以通过执行wineconsole cmd中运行应用进行调试
上述页面中，其中按其说法执行 winetricks打开时提示:Graphical UI can be started with --gui,按提示改为 winetricks --gui即可
如果不使用GUI方式启动，可直接终端输入：winetricks riched20 riched30 ie8 vcrun6 flash11 gdiplus msls31 msxml6 vcrun2005 vcrun2008 winhttp
或参考http://www.longene.org/forum/viewtopic.php?t=4700页面上的安装说明（其中提到的WINEQQ是已经连同WINE一同打包的QQ版本，不用另安装WINE，直接双击下载的deb即可）
注：也可直接使用在线版QQ，即web2.qq.com
#qq

#taobao
使用wine安装旺旺时，注意安装完成后，使用winecfg配置libary标签页中的gdiplus.dll为build then native, 否则会提示缺少该dll。
同样的在运行其他程序若提示找不到某个dll时，可以尝试将该DLL多配置几次不同的的属性直到程序可正常运行为止
#taobao

#nodejs
*NODEJS环境搭建：
  1.在终端中输入sudo apt-get install nodejs
  2.安装完成后在任意目录建个测试文件，如/home/bee/test.js,内容为console.log('test here');
  3.在终端中执行nodejs /home/bee/test.js,输出test here,ok!!!

*nodejs npm安装:
  1.在终端中输入sudo apt-get install npm
  2.在终端中进入到需要添加包的目录，如cd /home/bee/文档/mywork/node，假设要安装express,执行npm install express即可

＊mongodb安装：
   1.sudo apt-get install mongodb
   2.安装完后可以用pgrep mongo -l 查看到已经在进程中跑了
   3.直接执行mongo,看到已经自动帮你连接到test库了

*mongodb服务设置（参考：http://www.cnblogs.com/alexqdh/archive/2011/11/25/2263626.html）
   1.执行locate mongod | grep -v -E 'home|host'（注：-v 表示不包含，-E表示符合多字符过滤条件），结果如下：
/etc/mongodb.conf
/etc/init/mongodb.conf
/etc/init.d/mongodb
/etc/logrotate.d/mongodb-server
/usr/bin/mongod
/usr/bin/mongodump
/usr/include/db/interrupt_status_mongod.h
/usr/include/mongo/db/interrupt_status_mongod.h
/usr/share/doc/mongodb
/usr/share/doc/mongodb-clients
/usr/share/doc/mongodb-dev
/usr/share/doc/mongodb-server
/usr/share/doc/mongodb/README
/usr/share/doc/mongodb/README.Debian
/usr/share/doc/mongodb/changelog.Debian.gz
/usr/share/doc/mongodb/copyright
/usr/share/doc/mongodb-clients/README
/usr/share/doc/mongodb-clients/changelog.Debian.gz
/usr/share/doc/mongodb-clients/copyright
/usr/share/doc/mongodb-dev/README
/usr/share/doc/mongodb-dev/changelog.Debian.gz
/usr/share/doc/mongodb-dev/copyright
/usr/share/doc/mongodb-server/README
/usr/share/doc/mongodb-server/changelog.Debian.gz
/usr/share/doc/mongodb-server/copyright
/usr/share/man/man1/mongod.1.gz
/usr/share/man/man1/mongodump.1.gz
/var/cache/apt/archives/mongodb-clients_1%3a2.2.4-0ubuntu1_amd64.deb
/var/cache/apt/archives/mongodb-dev_1%3a2.2.4-0ubuntu1_amd64.deb
/var/cache/apt/archives/mongodb-server_1%3a2.2.4-0ubuntu1_amd64.deb
/var/cache/apt/archives/mongodb_1%3a2.2.4-0ubuntu1_amd64.deb
/var/lib/mongodb
/var/lib/dpkg/info/mongodb-clients.list
/var/lib/dpkg/info/mongodb-clients.md5sums
/var/lib/dpkg/info/mongodb-dev.list
/var/lib/dpkg/info/mongodb-dev.md5sums
/var/lib/dpkg/info/mongodb-server.conffiles
/var/lib/dpkg/info/mongodb-server.list
/var/lib/dpkg/info/mongodb-server.md5sums
/var/lib/dpkg/info/mongodb-server.postinst
/var/lib/dpkg/info/mongodb-server.postrm
/var/lib/dpkg/info/mongodb-server.preinst
/var/lib/dpkg/info/mongodb-server.prerm
/var/lib/dpkg/info/mongodb.list
/var/lib/dpkg/info/mongodb.md5sums
/var/lib/mongodb/journal
/var/lib/mongodb/mongod.lock
/var/lib/mongodb/journal/j._0
/var/lib/mongodb/journal/prealloc.1
/var/lib/mongodb/journal/prealloc.2
/var/log/mongodb
/var/log/mongodb/mongodb.log
/var/log/upstart/mongodb.log
以上黑体部分是我们需要用到的
 2.编写SHELL，内容如下：
  #!bash
 #安装mongo服务
 #cd /usr/bin
 # --dbpath：指定mongo的数据库文件夹--logpath：指定mongo的log日志文件名--logappend：表示log的写入是采用附加的方式，默认的是覆盖之前的文件
 echo mypsw | sudo -S ./mongod --dbpath /var/lib/mongodb/ --logpath /var/log/mongodb/mongodb.log --logappend &
#把上述脚本放在用户启动配置文件中，通过u conf 3编辑/etc/rc.local即可
  接下来就可以保存到指定目录中,如mongo_service.sh，并执行些shell即可，sh yourpath/mongo_service.sh 或 source yourpath/mongo_service.sh,
这里建议自定义一个文件夹，专门用来存放自定义的脚本，并将该目录设置到全局PATH变量中方便调用

  注意：如果是系统非正常关闭，这样启动会报错，由于mongodb自动被锁上了，这是需要进入mongodb数据库文件所在的目录（/var/lib/mongodb/）,删除目录中的mongodb.lock文件,然后再进行上述操作。
#数据迁移
导出数据：mongodump --host localhost:27017 -d dump_dbname -uusername -ppasswd -o your_mongo_db_path --directoryperdb
导入数据：mongorestore --directoryperdb your_dump_dbname_path

#node

#env
＊环境变量设置
参考：http://blog.csdn.net/ylgrgyq/article/details/6955591
从上述参考中我只需要在启动shell的时候加载自定义的环境变量，故仅需要修改~/.bashrc，执行sudo vim ~/.bashrc,打开后在最后加入如下内容：
export PATH=$PATH:"Ubuntu One/shell"
chmod 764 'Ubuntu One'/shell/*.sh
配置完后，重启终端即可，这样以后只要在~/Ubuntu One/shell下建立的sh文件均可直接输入文件名直接在shell下执行了。由于Ubuntu One是云服务，所以即使下次重装系统或在其他机子上使用也很方便。
#env

#pass
＊使用管道输入ROOT密码
    echo password | sudo -S shutdown -r now
#pass

#kill
＊按进程名称杀死进程
kill -9 `ps ax|grep aliasname|grep -v grep|awk '{print $1}'`
#kill

#start
*修改开机启动时间
sudo chmod 777 /boot/grub/grub.cfg
sudo vim /boot/grub/grub.cfg
将timeout部分改为想要的时间即可（小贴士:/timeout进行搜索,n搜索下一个）
注：改完后将权限改回444
#start

#grep
*查找当前目录下所有包含指定关键字的文件,其中R表示递归，l表示只显示文件列表而不显示关键字所在信息,w则匹配整个关键字
grep -Rlw --include="*.*" key "$PWD"
#grep

#webkit
*安装并设置node_webkit环境
下载安装包node-webkit-v0.7.2-linux-ia32.tar.gz，解压包到/usr/lib下，并配置/usr/lib/node-webkit-v0.7.2-linux-ia32到PATH环境变量中，在SHELL中运行nw,提示错误信息：“ error while loading shared libraries: libudev.so.0: cannot open shared object file: No such file or directory
”，这个信息是说没有找到共享对象libudev.so.0，这时我们输入locate libudev.so,发现有更新的版本1和1.2.2，我们可以创建一个链接将其指向更高版本试试，输入
$ sudo ln -fs /lib/i386-linux-gnu/libudev.so.1.2.2 /usr/lib/libudev.so.0 其中-f表示同名时强制覆盖 -s则表示软连接，
 注：创建后若发现无效，可使用rm -rf libudev.so.0
创建后发现执行nw后即可正常运行。
#webkit

#chrome
＊从http://download.tech.qq.com/soft/1/2/82053/ 下载并解压chromeplus-1.3.3.3_ubuntu_debian_i686.tar.gz，移动解压包到/usr/lib，并执行该目录下的chrome,将会提示缺少某些so对象，可以通过apt-file search ***.so命令来安装so对象，或者可以通过locate ***.so查找是否已存在相应的so,最后可能会需要执行
sudo ln -fs /usr/lib/i386-linux-gnu/libplds4.so /usr/lib/libplds4.so.0d
sudo ln -fs /usr/lib/i386-linux-gnu/libplc4.so /usr/lib/libplc4.so.0d
sudo ln -fs /usr/lib/i386-linux-gnu/libnspr4.so /usr/lib/libnspr4.so.0d
sudo ln -fs /usr/lib/i386-linux-gnu/libjpeg.so.8.0.2 /usr/lib/libjpeg.so.62
最后虽然安装并可运行，但常常崩溃，故暂无法使用
如果安装libXss.so有问题时请参考：http://askubuntu.com/questions/59703/skype-error-while-loading-shared-libraries-libxss-so-1-cannot-open-shared-obj
#chrome

#vim
*vim winmanager插件安装：
1.从http://www.vim.org/scripts/script.php?script_id=95下载winmanager
2.将解压包内的doc及plugin包放到vim安装的相应目录（通过locate vim查找到本机的路径在/usr/share/vim/vim73/doc中）
3.终端中执行sudo vim -c "helptags /usr/share/vim/vim73/doc" -c "q"或者在VIM(需要root打开)中执行helptags /usr/share/vim/vim73/doc，这样可以把帮助文档导入vim中，以后可在需要时在vim中输入help winmanager查看帮助文档
4.为了使用快捷操作该插件，还需要做键盘映射，执行命令：sudo vim /etc/vim/vimrc, 并加入以下代码
"my_custom_setting
"let g:winManagerWindowLayout = "FileExplorer"
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>
"set nu
set tabstop=2
set shiftwidth=2
"设置交换文件存放路么，避免直接在当前路径生成交换文件造成的GIT代码提交
set bdir-=.
set backupdir+=$TEMP//
set dir-=.
set directory+=$TEMP//
"my_custom_setting
#vim

#shell
＊使脚本中的cd命令执行有效
首先理解以下两点：
1. ***.sh执行 会fork子进程执行 （切换路径只在子进程里进行和有效）
2. source ***.sh 不会fork子进程 在当前shell环境下执行 (当前shell环境里路径切换了)
所以要使脚本里的cd有效，则不可以直接输入sh ***.sh或***.sh,而应该输入source ***.sh或. ***.sh
#shell

#grub
*在win7中使用分区工具后导致无法通过grub进入引导界面，而是直接grub拯救命令模式，解决方法如下
1.使用ls查看所有硬盘分区,比如查询结果为(hd0,0),(hd0,1),(hd0,2),(hd0,3)...
2.使用ls (hd0,0)/boot/grub/ 查看哪个分区可返回结果，可返回结果的才是我们系统的主分区，假设这里(hd0,8)是我们得到的主分区
3.最后执行set root=(hd0,8);set prefix=(hd0,8)/boot/grub;insmod normal;normal即可进入引导界面了。
4.进入系统后，我们还需要将grub还原，在终端输入sudo grub-install /dev/sda;sudo update-grub，完成更新。
#grub

#mount
*挂载
#将sda6分区挂到/media/beebon/9C4C1FA94C1F7D68下
sudo mkdir /media/beebon/9C4C1FA94C1F7D68;sudo mount /dev/sda6 /media/beebon/9C4C1FA94C1F7D68   
#取消挂载
sudo umount /media/beebon/9C4C1FA94C1F7D68;sudo rmdir     
#mount     

#mono
直接参考：
http://www.jexus.org/
http://www.mono-project.com/Mono:Linux
以下简单说明安装步骤
1.首先我并没按上述方式安装mono环境，而是直接在软件中心安装了mono的IDE软件MonoDevelop（3.0.3.2）,该软件已包含了基本的开发编绎环境,安装完后找个以前做的项目编绎发现提示could not obtain a c# compliler c# compiler not found for mono/.net 3.5,网上找了个解决方案，执行sudo apt-get install mono-gmcs,将安装2.0，3.0编绎器及通用语言接口，另外执行sudo apt-get install mono-dmcs则安装4.0编绎器及接口(monodevelop默认已安装dmcs),所以也可以通过修改构建目标为4.0来解决此问题
2.其次是安装.net服务器环境，这里使用的是jexus服务器，一款国产的服务器，其功能甚至超过了IIS6，具体安装方法如下
cd ~/Downloads
wget http://www.linuxdot.net/down/jexus-5.4.3.tar.gz #默认下到当前目录，也可指定下载目录，加－O ~/Downloads/ 
tar -zxvf jexus-5.4.3.tar.gz 
cd jexus-5.4.3 
sudo ./install
cd /usr/jexus
sudo ./jws regsvr
sudo ./jws start
u chrome http://localhost/info #打开默认测试网站，若正常显示则表示安装成功
默认的网站配置文件在/usr/jexus/siteconf/default中，一般一个网站一个配置文件
可以直接修改默认配置，也可为自己的网站新建自己的配置，一般可直接复制默认配置进行修改，输入sudo cp siteconf/default siteconf mysite即可，修改mysite配置文件，一般修改下root的路径root、端口号port、网站域名hosts、索引页indexs、扩展名aspnet_exts(配置文件的路径放在jws.conf中，如果有需要也可以修改，不过建议使用默认路径就好)，每次新建一个站点配置请重启一下服务器，确保新的配置可以重新加载
注：配置中建议路径中不要使用中文或空格等特殊符号，路径中不使用～表示，写为绝对路径
#安装调试工具mono-xsp4,若是基于asp.net2.0则下载xsp2.可从软件中心中下载，或直接输入sudo apt-get install mono-xsp4-base下载安装
#mono

#suspend
系统挂起后，有时无法重新唤醒，目前找到的方案是尽可能减少损失的方案
按住ctrl+alt+PrtSc不放，同时输入reisub后重启系统，该方案并不是最理想，不过至少不用关机再开启。关于reisub参数请网上搜索相关说明，这些参数的顺序也会影响执行效果，请注意
#suspend

#git
#安装配置
sudo apt-get install git
#设置git的user name和email：
$ git config --global user.name "myusername"
$ git config --global user.email "myemail"
#设置github的参数(其中token可在profile-application-create new token来生成，生成后无法继续查看，需要时只能另生成，所以若不想每次重新生成则需妥善保管)：
$ git config --global github.user myusername
$ git config --global github.token mytoke
#获取GITHUB源码
可直接使用git命令，如git clone --recursive git@github.com:G33kLabs/Node.VaSH.git，那么默认会下载到你当前目录上(注：写在脚本上运行时会执行无效)
#防止提交交换文件的方法
cd到项目目录，执行echo *.swp >> .gitignore
#SSH连接参考：
https://help.github.com/articles/generating-ssh-keys
http://mzhou.me/article/33001/ #这里还包含很多操作说明
#mangit
#常用说明
- 1.建立本地仓库源码仓库源
  - mkdir the_path_your_resp
  - cd the_path_your_resp;git init --bare #建议加上bare参数，否则复制库提交时有可能出现refusing to update checked out branch，当然你也可以事后执行git config core.bare true来修改此属性值
  以上就建立了一个空的本地仓库，如果需要加入一些初始代码做为最初版本的话，可以直接加入，然后记得在该目录下执行以下代码
  - git add . # or git add *
  - git commit -m 'first init the resp' #这两句可合并为一句git commit -a -m 'first init the resp'
  注：这里不需要执行git push origin master,这里需要补充另一个知识，说明如下
  git的三个目录：工作目录、缓存目录、HEAD目录，在仓库源中可以这么理解：仓库源中更新的代码先是在工作目录中得到更新，此时这是我们实际存在的代码，当使用git add命令后，其实只是下达了一个指令说我要加入这么一个更新，但缓存区里并没有真正得到更新，这时你还是可以做一些撤消之类的动作，当执行了git commit后，则直接更新到缓存区了，而由于我们这本来就是源仓库，所以不存在需要配置remote.origin.url，所以第三个目录head目录也就相当于与缓存目录内容一致
  最后我们还需要做一件事，就是把目录切换到分支中，这里切换到开发分支,我们日常开发以此分支为主，直到重大版本或里程碑时方并入主分支
  - git checkout -b dev master #指新建并切换到dev分支，该分支属于master主干下(相当于执行了git branch dev;git checkout dev)
  注：删除分支使用git branch -d branch_name,不加任何参数则可直接查看所有分支信息及当前分支
      若要查看各个分支最后一个提交对象的信息，运行git branch -v
      使用--merged 或--nomerged查看合并或未合并的分支情况
  2.复制源仓库
  - cd what-ever-path-you-like
  - git clone the_path_your_resp
  此时你将得到一个最新的与源仓库一致的版本
  接下来切换到开发分支
  - git checkout -b dev
  如果开发分支有代码更新，那么你可能不能简单的输入git pull(git pull即git fetch;git merge),而是输入如下
  - git pull origin dev #这样才能正常获取源仓库最新代码并与自己工作目录的代码合并
  如果发现自己工作目录的代码不小心改错了，又想还源到源仓库的最新版本，可以这样做
  - git fetch #此句要执行才可正常获取更新，试过不执行此句直接执行下句无法正常更新
  - git checkout the_file_you_want_to_restore # 这是先将源仓库的最新代码存入缓存目录后更新指定文件到工作目录中，如果需要更新的是某个分支则需要指明，如下：
  -get checkout origin/dev the_file_you_want_to_restore
  #也可以指定还原指定版本，一般做法如下
  - git log the_file_you_want_to_restore #从日志中查找出需要回退的版本号后
  - git reset the_version_number the_file_you_want_to_restore #将文件回退到此仓库的指定版本
  - git commit -m 'restore to the version ***' #提交更新
  - git checkout the_file_you_want_to_restore #更新缓存目录的指定版本到工作目录
  - git push origin dev
  注：这里若不指明还原文件，则还原整个版本，故需谨慎还原。如果在此复制库中还原整个版本后同时还需要还原源仓库与其一致时，可执行git push -f,即强制将此库代码推至源仓库
#mangit
#git

#phonegap
参考http://phonegap.com/install/
安装：
sudo npm install -g phonegap #按此方法安装出错，需要加上f参数强制安装

使用方法：
$ phonegap create my-app
$ cd my-app
$ phonegap local run android #官网是没加local,则以remote方式运行，若没安装android sdk则会报错，可参考http://stackoverflow.com/questions/17589305/cordova-node-js-phonegap
要使上述命令可顺利运行，还需安装android sdk,
#phonepap
