#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"


ls -lh app/build.gradle.kts

sed -i '/android {/a \' app/build.gradle.kts
sed -i '/android {/a \    }' app/build.gradle.kts
sed -i '/android {/a \        }' app/build.gradle.kts
sed -i '/android {/a \            storePassword = "12345678"' app/build.gradle.kts
sed -i '/android {/a \            storeFile = file("12345678.jks")' app/build.gradle.kts
sed -i '/android {/a \            keyPassword = "12345678"' app/build.gradle.kts
sed -i '/android {/a \            keyAlias = "12345678"' app/build.gradle.kts
sed -i '/android {/a \        create("keyStore") {' app/build.gradle.kts
sed -i '/android {/a \   signingConfigs {' app/build.gradle.kts


match=$(grep "named(" app/build.gradle.kts)
if [ -n "$match" ]; then
    sed -i '/ named(/a \            signingConfig = signConfig' app/build.gradle.kts
else
    sed -i '/ getByName(/a \            signingConfig = signConfig' app/build.gradle.kts
fi

sed -i '/ buildTypes {/a \        val signConfig = signingConfigs.getByName("keyStore")' app/build.gradle.kts

sed -i 's/signingConfigs.getByName("debug")/signConfig/g' app/build.gradle.kts


##
echo "cat app/build.gradle.kts:"
echo ""
cat app/build.gradle.kts
echo ""

exit 0
