#!/bin/bash

set -xe

# copy input to output
./concourse/scripts/copy-dir.sh input_meta build_meta

# read branch name
cd code-base/
COMMIT=$(cat .git/ref)
BRANCH=$(git name-rev $COMMIT | awk '{print $2;}')
cd ..

# inject variables into text
text="${text//\{BRANCH\}/$BRANCH}"

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt
