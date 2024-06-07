#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"


match=$(grep "kotlinx.bundles.coroutines" app/build.gradle.kts)
if [ -z "$match" ]; then
    echo  "repalce mangaLegado dependencies:"
    

    sed -i 's/${kotlinx.versions.kotlin.version}/1.9.10/g' mangaLegado/build.gradle
    sed -i 's/${compose.versions.compiler}/1.5.7/g' mangaLegado/build.gradle

    sed -i 's/kotlinx.reflect/"org.jetbrains.kotlin:kotlin-reflect:1.9.10"/g' mangaLegado/build.gradle

    # kotlinx.bundles.coroutines
    sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")' mangaLegado/build.gradle
    sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")' mangaLegado/build.gradle
    sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-guava:1.7.3")' mangaLegado/build.gradle
    sed -i '/kotlinx.bundles.coroutines/d' mangaLegado/build.gradle

    sed -i 's/kotlinx.serialization.json.okio/"org.jetbrains.kotlinx:kotlinx-serialization-json-okio:1.6.0"/g' mangaLegado/build.gradle
    sed -i 's/kotlinx.serialization.protobuf/"org.jetbrains.kotlinx:kotlinx-serialization-protobuf:1.6.0"/g' mangaLegado/build.gradle
    sed -i 's/compileOnly(kotlinx.serialization.json)/compileOnly("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")/g' mangaLegado/build.gradle

    sed -i 's/libs.bundles.js.engine/"app.cash.quickjs:quickjs-android:0.9.2"/g' mangaLegado/build.gradle

    # androidx.bundles.lifecycle
    sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-common:2.6.2")' mangaLegado/build.gradle
    sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-process:2.6.2")' mangaLegado/build.gradle
    sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-runtime-ktx:2.6.2")' mangaLegado/build.gradle
    sed -i '/androidx.bundles.lifecycle/d' mangaLegado/build.gradle

    sed -i 's/libs.injekt.core/"com.github.inorichi.injekt:injekt-core:65b0440"/g' mangaLegado/build.gradle
    sed -i 's/libs.rxjava/"io.reactivex:rxjava:1.3.8"/g' mangaLegado/build.gradle
    sed -i 's/libs.okhttp.core/"com.squareup.okhttp3:okhttp:5.0.0-alpha.11"/g' mangaLegado/build.gradle

    sed -i 's/libs.jsoup/"org.jsoup:jsoup:1.16.1"/g' mangaLegado/build.gradle

    ####### 替换版本
    sed -i 's/material:1.6.1/material:1.10.0/g' mangaLegado/build.gradle
    sed -i 's/coil_version = "2.0.0"/coil_version = "2.4.0"/g' mangaLegado/build.gradle
    sed -i 's/core-ktx:1.8.0/core-ktx:1.12.0/g' mangaLegado/build.gradle
    sed -i 's/appcompat:1.4.2/appcompat:1.6.1/g' mangaLegado/build.gradle
    sed -i 's/activity-ktx:1.4.0/activity-ktx:1.8.0/g' mangaLegado/build.gradle
    sed -i 's/fragment-ktx:1.4.1/fragment-ktx:1.3.6/g' mangaLegado/build.gradle
    sed -i 's/viewpager2:1.0.0/viewpager2:1.1.0-beta02/g' mangaLegado/build.gradle
    sed -i 's/webkit:1.4.0/webkit:1.8.0/g' mangaLegado/build.gradle

fi

echo ""
cat mangaLegado/build.gradle
echo ""

exit 0