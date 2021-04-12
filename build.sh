#
set -ex
if [ -e init.sh ]; then
 . init.sh
fi

jekyll build

ls -la



