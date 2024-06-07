#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo ""
echo "test replace base resources ...."
# i18n/src/commonMain/resources/MR/zh-rCN/strings.xml
tmp_file="tmp_myfile.txt"
cat << EOF > $tmp_file
<string name="ext_revoke_trust">撤销已信任的未知插件</string>

<!-- Extension Repos -->
<string name="action_add_repo">添加仓库</string>
<string name="action_add_repo_message">在 应用 中添加仓库，输入的网址结尾应为“index.min.json”。</string>
<string name="extension_repos">插件仓库</string>
<plurals name="num_repos"><item quantity="one">%d 个仓库</item><item quantity="other">%d 个仓库</item></plurals>
<string name="error_repo_exists">此仓库已存在！</string>
<string name="repo_cannot_be_blank">仓库名不能为空！</string>
<string name="snack_repo_deleted">仓库已删除</string>
<string name="invalid_repo_name">仓库网址无效</string>
<string name="confirm_repo_deletion">删除仓库</string>
<string name="delete_repo_confirmation">确定要删除仓库“%s”吗？</string>
<string name="url_not_set_click_again">仓库网址没设置，请编辑网址</string>

<!-- search manga chapters -->
<string name="fetch_manga_chapters">在搜索结果显示漫画章节数</string>
<string name="fetch_manga_chapters_summary">自动获取最新的漫画详情和章节并将其保存在数据库中\n警告：此功能将极大地影响设备性能并增加到源的网络流量</string>

<string name="force_bypass_cloudflare">尝试强制绕过cloudflare错误</string>
<string name="force_bypass_cloudflare_summary">当应用程序试图强制绕过时，此功能可能会降低网络速度\n警告：这是一个实验性功能，仅适用于某些来源</string>
<string name="toggle_force_bypass_cloudflare">切换cloudflare旁路</string>
EOF
sed -i '/^$/d' $tmp_file
sed -i '/^#/d' $tmp_file
sed -i '/<!--/d' $tmp_file
cat $tmp_file

t_file="app/src/main/res/values-zh-rCN/strings.xml"
if test -f $t_file ; then
  
  
  echo "" >> $t_file


  cat $tmp_file | while read line
    do   
    fix_txt="$line"
    echo "fix_txt: $fix_txt"
    find_txt=`echo "$fix_txt" | awk -F '\"' '{ print $2 }'`
    echo "find_txt: $find_txt"
    match=`grep "\"$find_txt\"" $t_file`
    if [ -z "$match" ]; then
      echo "$fix_txt" >> $t_file
      echo "fix succ."
    else
      echo "fix Error !!!!"
    fi
  done

  # delete  </resources>
  sed -i '/<\/resources>/d' $t_file
  # replace </resources>
  echo "</resources>" >> $t_file

  echo ""
  echo "Fix file: $t_file"
  tail -n 50 $t_file
  echo ""
fi
rm -f $tmp_file
exit 0