#!/usr/bin/env bash

# 出错退出
# set -e

HOME="$(cd "`dirname "$0"`"/..; pwd)"

self_sh_path="$HOME/self-sh"
mkdir -p $self_sh_path
# chmod 777 $self_sh_path/*.sh

# ls -lh "$self_sh_path/*.sh"
ls $self_sh_path

for file_path in `find $self_sh_path -type f -name "*.sh"`; do
    echo "run : $file_path"
    sh $file_path
done

exit 0