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
cat code-base/.git/commit_message
cat code-base/.git/committer
COMMIT=$(cat code-base/.git/ref)
cd code-base/
git branch --contains $COMMIT
git reflog show --all | grep $COMMIT
git name-rev $COMMIT
