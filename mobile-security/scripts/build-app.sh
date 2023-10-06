#!/bin/bash -e
# From: https://authmane510.medium.com/how-to-build-an-apk-from-command-line-without-ide-7260e1e22676

if [[ -z $1 ]]; then
    echo usage: build-app.sh APP_DIR >&2
    return 1
fi

app_dir="$1"
app=$(tr '[:upper:]' '[:lower:]' <<< $app_dir)
prefix="$(brew --prefix)/share/android-commandlinetools"
build_tools="$prefix/build-tools/33.0.0"
key=~/.android/mykey.keystore

AAPT="$build_tools/aapt"
DX="$build_tools/d8"
ZIPALIGN="$build_tools/zipalign"
APKSIGNER="$build_tools/apksigner"
PLATFORM="$prefix/platforms/android-33/android.jar"

cd $app_dir

echo "Cleaning..."
rm -rf obj/* || true
rm src/com/example/$app/R.java || true

echo "Generating R.java file..."
$AAPT package -f -m -J src -M AndroidManifest.xml -S res -I $PLATFORM

echo "Compiling..."
javac -d obj -classpath src -bootclasspath $PLATFORM -source 1.7 -target 1.7 src/com/example/$app/MainActivity.java
javac -d obj -classpath src -bootclasspath $PLATFORM -source 1.7 -target 1.7 src/com/example/$app/R.java

echo "Translating in Dalvik bytecode..."
zip -r obj obj
$DX obj.zip

echo "Making APK..."
$AAPT package -f -m -F bin/$app.unaligned.apk -M AndroidManifest.xml -S res -I $PLATFORM
$AAPT add bin/$app.unaligned.apk classes.dex

echo "Aligning and signing APK..."
if [[ ! -f $key ]]; then
    cat >&2 <<- EOF

	Error: you don't have a key, create one with:
	  keytool -genkey -v -keystore $key -keyalg RSA -sigalg SHA1withRSA -keysize 2048 -validity 10000
	EOF
    exit 1
fi
$APKSIGNER sign --ks $key bin/$app.unaligned.apk
$ZIPALIGN -f 4 bin/$app.unaligned.apk bin/$app.apk
