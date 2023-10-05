#!/bin/bash -e
curl 'https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip' | bsdtar -xf -
curl -L 'https://redirector.gvt1.com/edgedl/android/repository/emulator-darwin_x64-10696886.zip' | bsdtar -xf -
