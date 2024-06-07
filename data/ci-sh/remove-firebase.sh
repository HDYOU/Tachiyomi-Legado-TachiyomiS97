#!/bin/sh

# 出错退出
# set -e

export HOME="$(
    cd "$(dirname "$0")"/..
    pwd
)"

ls /bin/sh -al 

echo "run path: $PWD"

files_list=("build.gradle.kts" "CONTRIBUTING.md" 
    "app/src/main/java/exh/log/CrashlyticsPrinter.kt" 
    "gradle/sy.versions.toml" 
    "app/src/main/java/eu/kanade/tachiyomi/crash/GlobalExceptionHandler.kt" 
    "app/build.gradle.kts" 
    "app/src/main/java/eu/kanade/tachiyomi/App.kt" 
    "gradle/libs.versions.toml" 
    "app/src/main/java/eu/kanade/tachiyomi/ui/main/MainActivity.kt" 
    "app/proguard-rules.pro" 
    "app/src/main/java/eu/kanade/tachiyomi/ui/setting/SettingsAdvancedController.kt" 
)

for file_path in ${files_list[*]}; do
    echo "file_path: $file_path"
    test -f "$file_path" && sed -i '/firebase/d' "$file_path"
    test -f "$file_path" && sed -i '/Firebase/d' "$file_path"
done

exit 0