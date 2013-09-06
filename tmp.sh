#if [ -z "$1"] then echo "缺少git项目名称";exit fi
cd ~/'Ubuntu One'/shell
git init --bare
git add .
git commit -am 'fisrt commit shell'
git remote add orgin https://github.com/beebon/gitone
git push origin master
