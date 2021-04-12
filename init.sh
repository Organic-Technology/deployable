# 


set -x
ls -l
cat .git/config
# one time deal !
if [ -e init.sh ]; then
git clone https://ipfs.blockringtm.ml/ipns/QmWZ2uR4NHLZNwgZVqAXK1UpLiueFdz632X1CgYKXrgxZR/d/dr/drit/websites/noticeable.gq.git
mv .git git
mv -n noticeable.gq/.git .
mv -n noticeable.gq/* .
mv init.sh _init.sh
fi

cat .git/config
ls -l

