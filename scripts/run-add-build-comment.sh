#!/bin/bash

set -xe

# copy input to output
./concourse/scripts/copy-dir.sh input_meta build_meta

# read branch name
cd code-base/
COMMIT=$(cat .git/ref)
BRANCH=$(git name-rev $COMMIT | awk '{print $2;}')
echo $BRANCH

message = "updated BRANCH branch"
echo "${message//BRANCH/$BRANCH}"

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt
