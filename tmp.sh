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
