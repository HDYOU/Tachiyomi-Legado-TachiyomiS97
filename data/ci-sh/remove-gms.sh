#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"


test -f build.gradle.kts && sed -i '/libs.google.services.gradle/d' build.gradle.kts
test -f build.gradle.kts && sed -i '/gms/d' build.gradle.kts
test -f build.gradle.kts && sed -i '/googleServices/d' build.gradle.kts

test -f app/build.gradle.kts && sed -i '/gms/d' app/build.gradle.kts
test -f app/build.gradle.kts && sed -i '/googleServices/d' app/build.gradle.kts
test -f gradle/libs.versions.toml && sed -i '/gms/d' gradle/libs.versions.toml
    
test -f app/src/main/AndroidManifest.xml && sed -i 's/com.google.android.gms.permission.AD_ID/android.permission.QUERY_ALL_PACKAGES/g' app/src/main/AndroidManifest.xml
test -f app/src/main/AndroidManifest.xml && sed -i '/com.google.android.gms.actions.SEARCH_ACTION/d' app/src/main/AndroidManifest.xml

# J2k
test -f buildSrc/src/main/kotlin/Dependencies.kt && sed -i '/gms/d' buildSrc/src/main/kotlin/Dependencies.kt

# oss
test -f app/src/main/java/eu/kanade/tachiyomi/ui/more/AboutController.kt && sed -i '/gms/d' app/src/main/java/eu/kanade/tachiyomi/ui/more/AboutController.kt
test -f app/src/main/java/eu/kanade/tachiyomi/ui/more/AboutController.kt && sed -i '/OssLicensesMenuActivity/d' app/src/main/java/eu/kanade/tachiyomi/ui/more/AboutController.kt

# activy
# test -f app/src/main/AndroidManifest.xml && sed -i 's/com.google.android.gms.oss.licenses.OssLicensesMenuActivity/.ui.webview.WebViewActivity/g' app/src/main/AndroidManifest.xml
# test -f app/src/main/AndroidManifest.xml && sed -i 's/com.google.android.gms.oss.licenses.OssLicensesActivity/.ui.webview.WebViewActivity/g' app/src/main/AndroidManifest.xml
# test -f app/src/main/AndroidManifest.xml && sed -i 's/@style\/Theme.OSS/@android:style\/Theme.Translucent.NoTitleBar/g' app/src/main/AndroidManifest.xml
# 删除匹配行及上一行
test -f app/src/main/AndroidManifest.xml && sed -i -n '$!N;/com.google.android.gms.oss.licenses.OssLicensesMenuActivity/!P;D' app/src/main/AndroidManifest.xml
test -f app/src/main/AndroidManifest.xml && sed -i -n '$!N;/com.google.android.gms.oss.licenses.OssLicensesActivity/!P;D' app/src/main/AndroidManifest.xml
test -f app/src/main/AndroidManifest.xml && sed -i '/@style\/Theme.OSS/d' app/src/main/AndroidManifest.xml

exit 0