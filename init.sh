# 


echo "init: start"
echo "initial git config:"
cat .git/config
set -x
git fetch origin master
git status
git config user.email bot@netlify.app
git config user.name --unset
git config user.name --unset
git config user.name --unset
git config user.name --unset
git config user.name --unset
git config user.name "Netlify Bot"
set +x


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
 #git config pull.rebase false
 #git config --unset pull.ff
 git rev-parse --short HEAD
 echo site already initialized !
 if true; then
 set -x
 gitid=$(git rev-parse HEAD)
 git checkout master
 git merge --allow-unrelated-histories $gitid
 git status
 gitid=$(git rev-parse origin/master)
 git merge --allow-unrelated-histories $gitid
 set +x
 fi
 echo git checkout and pull origin/master
 #git checkout origin/master
 git pull origin master --allow-unrelated-histories
 echo git revs:
 git rev-parse --short HEAD
 git log -1
fi
ls -l


echo "init: done"

true
