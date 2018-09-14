#!/bin/bash

set -xe

# copy input to output
./concourse/scripts/copy-dir.sh input_meta build_meta

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt
# TODO: debugging
ls -la code-base/.git
cat code-base/.git/HEAD
cat code-base/.git/FETCH_HEAD
ls -la code-base/.git/branches

cd code-base/
BRANCH=$(git symbolic-ref --short HEAD)
echo $BRANCH
