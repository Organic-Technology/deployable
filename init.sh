# 

qm=QmQxUgsJRc73pmeh5VD9aCxWx3GPTDWxv2SnCtKF36YAjw

echo "init: start"
echo "initial git config:"
cat .git/config
set -x
git status
git config user.email bot@netlify.app
git config --unset-all user.name
git config --replace-all user.name "Netlify Bot"

if push_url=$(git remote get-url --push origin 2>/dev/null); then
echo push_url: $push_url
fi
if ! url=$(git remote get-url origin 2> /dev/null); then
git remote add origin https://ipfs.blockringtm.ml/ipfs/$qm/d/dr/drit/websites/noticeable.gq.git
else
git remote remove origin
#git remote add --mirror=fetch source http://ipfs.blockringtm.ml/ipfs/$qm/d/dr/drit/websites/noticeable.gq.git
git remote add origin https://ipfs.blockringtm.ml/ipfs/$qm/d/dr/drit/websites/noticeable.gq.git
#git remote set-url --delete source $url
#git remote set-url --add source http://ipfs.blockringtm.ml/ipfs/$qm/d/dr/drit/websites/noticeable.gq.git
#git remote set-url --delete source $(git remote get-url source)
fi
git fetch origin master


set +x
# one time deal !
if ! git remote -v | grep -q blockring; then
echo cloning from dgit ...
git clone https://ipfs.blockringtm.ml/ipns/QmWZ2uR4NHLZNwgZVqAXK1UpLiueFdz632X1CgYKXrgxZR/d/dr/drit/websites/noticeable.gq.git src
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
 git rebase master 
 git rev-parse HEAD
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
