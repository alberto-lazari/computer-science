#!/bin/bash -e

arch=x86_64
prefix=/usr/local/share/android-commandlinetools

if -f /usr/local/bin/brew &> /dev/null; then
    arch -x86_64 /usr/local/bin/brew install android-commandlinetools
else
    prefix=~/Library/Android/sdk
    [[ -d $prefix ]] || mkdir -p $prefix/cmdline-tools

    # Get from curl
    curl 'https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip' --output cmdline-tools.zip
    unzip cmdline-tools.zip && rm cmdline-tools.zip
    mv cmdline-tools $prefix/cmdline-tools/latest
fi

arch -x86_64 "$prefix/cmdline-tools/latest/bin/sdkmanager" --install 'platform-tools' 'platforms;android-33' "system-images;android-33;google_apis_playstore;$arch"
arch -x86_64 "$prefix/cmdline-tools/latest/bin/avdmanager" create avd --name Test -k "system-images;android-33;google_apis_playstore;$arch"

# Link binaries in a PATH directory
[[ -d ~/bin ]] || mkdir ~/bin
ln -s "$prefix/platform-tools/adb" ~/bin/adb
ln -s "$prefix/emulator/emulator" ~/bin/emulator

# Add ~/bin to PATH
if ! which adb &> /dev/null; then
    echo Looks like ~/bin is not in PATH >&2
    read -p "Do you want to append \`PATH="\$HOME/bin:\$PATH"\` to your ~/.zprofile? (y/N) " answer
    [[ $answer != [Yy] ]] || echo 'PATH="$HOME/bin:$PATH"' >> ~/.zprofile
fi

# Python scripts will need a non-trivial library
pip3 install androguard

cat << EOF
Run the Android emulator with:
  emulator -avd Test -no-snapshot -no-boot-anim -wipe-data &> /dev/null &
EOF
