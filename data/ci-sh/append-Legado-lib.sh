#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"


ls -lh
echo 'include(":mangaLegado")' >> settings.gradle.kts
sed -i '/implementation(projects.i18n)/a \    implementation(projects.mangaLegado)' app/build.gradle.kts
sed -i '/implementation("androidx.activity:activity-compose/a \    implementation(project(":mangaLegado"))' app/build.gradle.kts
#cat mangaLegado/proguard-rules.pro >> app/proguard-rules.pro

###  Set mangaLegado 
sed -i '/minifyEnabled/d'    mangaLegado/build.gradle

cat "$HOME/conf/ci-proguard-rules.pro.conf" >> app/proguard-rules.pro

exit 0