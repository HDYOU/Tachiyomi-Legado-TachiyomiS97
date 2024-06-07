#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

 echo "fix page images thread ...."
t_file="app/src/main/java/eu/kanade/tachiyomi/ui/reader/loader/HttpPageLoader.kt"
if test -f $t_file ; then

 match=`grep "repeat(" $t_file`
 if [ -z "$match" ]; then
  sed -i '/init {/a \        repeat(10) {' $t_file
  sed -i '56 a\        }' $t_file
  echo "fix succ."
 fi
 head -n 60 $t_file
fi
exit 0