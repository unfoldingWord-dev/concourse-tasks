#!/bin/bash

set -xe

FILE=translationCore-linux-x64-$VERSION-$HASH.zip

./node_modules/.bin/gulp build --linux || exit 1;
./node_modules/.bin/gulp release-linux --out=../build/$BRANCH/$FILE || exit 1;

echo "[Linux build $VERSION ($HASH)]($BUILD_CDN/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<$BUILD_CDN/$BRANCH/$FILE|Linux build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
