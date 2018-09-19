#!/bin/bash

set -xe

FILE64=translationCore-win-x64-$VERSION-$HASH.setup.exe
FILE32=translationCore-win-x32-$VERSION-$HASH.setup.exe

./node_modules/.bin/gulp build --win || exit 1;
./node_modules/.bin/gulp release-win64 --out=../build/$BRANCH/$FILE64 || exit 1;
./node_modules/.bin/gulp release-win32 --out=../build/$BRANCH/$FILE32 || exit 1;

# x64
echo "[Windows x64 build $VERSION ($HASH)]($BUILD_CDN/$FILE64) is ready for download." >> ../build_meta/comment.md
echo "<$BUILD_CDN/build/$BRANCH/$FILE64|Windows x64 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
# x32
echo "[Windows x32 build $VERSION ($HASH)]($BUILD_CDN/$FILE32) is ready for download." >> ../build_meta/comment.md
echo "<$BUILD_CDN/build/$BRANCH/$FILE32|Windows x32 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
