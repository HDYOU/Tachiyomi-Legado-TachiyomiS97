#!/usr/bin/env bash

# 出错退出
# set -e

# export HOME="$(cd "`dirname "$0"`"/..; pwd)"

for file_path in $(find buildSrc/src/ -type f -name "Commands.kt"); do
    echo "run : $file_path"

    sed -i '/runCommand(command: String)/,+6{/runCommand(command: String)/b;d}' $file_path

    sed -i '/runCommand(command: String)/a \    return providers.exec { commandLine = command.split(" ") }.standardOutput.asText.get().trim()' $file_path

    echo "org.gradle.unsafe.configuration-cache=true" >>  ~/.gradle/gradle.properties
    echo "org.gradle.unsafe.configuration-cache-problems=warn" >>  ~/.gradle/gradle.properties
done

exit 0