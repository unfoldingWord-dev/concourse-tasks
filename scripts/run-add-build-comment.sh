#!/bin/bash

set -xe

# copy input to output
./concourse/scripts/copy-dir.sh input_meta build_meta

# read branch name
BRANCH=$(./concourse/scripts/get-branch-name.sh code-base)

# inject variables into text
text="${text//\{BRANCH\}/$BRANCH}"

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt
