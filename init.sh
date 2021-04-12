# 


echo "init: start"
echo "initial git config:"
cat .git/config

set -x
# one time deal !
if ! git remote -v | grep -q blockring; then
echo cloning from dgit ...
git clone https://ipfs.blockringtm.ml/ipns/QmWZ2uR4NHLZNwgZVqAXK1UpLiueFdz632X1CgYKXrgxZR/d/dr/drit/websites/noticeable.gq.git
if [ -e noticeable.gq/.git ]; then
mv .git git
mv -n noticeable.gq/.git .
fi
#mv -n noticeable.gq/* .
git rev-parse --short HEAD
git checkout .
git status
mkdir _site
cp -p index.htm _site/index.htm

else
 echo site already initialized !
 git fetch origin master
 git log -1
 git checkout .
 git pull
 git log -1
fi
ls -l


echo "init: done"

true
