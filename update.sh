#!/usr/bin/env bash

o_dir=$HOME/Documents/octopress/octopress
s_dir=$HOME/usr/share/settings/software_settings

# update from octopress
origines=("${o_dir}/octopress/source/mac/macapp/index.md" "${o_dir}/octopress/source/windows/windowssoftware/index.md")
target=("$s_dir/MacApp.md" "$s_dir/WindowsSoftware.md")

i=0
while [ $i -lt "${#origines[@]}" ];do
  t=$(grep "^title" "${origines[$i]}"|head -n1|cut -d':' -f2)
  echo '#' "$t" > "${target[$i]}"
  n=$(sed "=" "${origines[$i]}" |grep -B1 "^\\-\\-\\-"|head -n4|tail -n1)
  sed -e "1,${n}d" "${origines[$i]}"|sed -e 's!{{site.imgpath}}!http://rcmdnk.github.io/images/!' >> "${target[$i]}"
  ((i++))
done
