#!/bin/bash

set -xe
source ../concourse/scripts/trycatch.sh

FILE=translationCore-linux-x64-$VERSION-$HASH.deb

./node_modules/.bin/gulp build --linux || exit 1;

try
(
  ./node_modules/.bin/gulp release-linux-deb --out=../build/$SAFE_BRANCH/$FILE || throw
)
catch || { # catch
  FILE=translationCore-linux-x64-$VERSION-$HASH.zip
  ./node_modules/.bin/gulp release-linux --out=../build/$SAFE_BRANCH/$FILE || exit 1;
}

echo "[Linux build $VERSION ($HASH)]($BUILD_CDN/build/$SAFE_BRANCH/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<$BUILD_CDN/build/$SAFE_BRANCH/$FILE|Linux build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
