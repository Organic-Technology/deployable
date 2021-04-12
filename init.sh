# 


set -x
git clone https://ipfs.blockringtm.ml/ipns/QmWZ2uR4NHLZNwgZVqAXK1UpLiueFdz632X1CgYKXrgxZR/d/dr/drit/websites/noticeable.gq.git
cat .git/config
mv .git git
mv -n noticeable.gq/.git .
mv -n noticeable.gq/* .
cat .git/config

ls -lR 

