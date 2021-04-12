#
set -ex
if [ -e init.sh -a ! -e _site ]; then
 . init.sh
fi

jekyll build

ls -la



