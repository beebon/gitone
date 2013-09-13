#if [ -z "$1"] then echo "缺少git项目名称";exit fi
cd ~/'Ubuntu One'/shell
if [ -n "$1" ]
then git init --bare;git add .
else git add -i
fi
git commit -am 'fisrt commit shell'
git remote add origin https://github.com/beebon/gitone.git
git push -u origin master -f #force push
