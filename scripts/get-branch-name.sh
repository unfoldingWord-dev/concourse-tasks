#!/bin/bash

# This script determines the branch name of a git repository

set -xe

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters. Requires path to git repository";
  exit 1;
fi

if [ -d "$1" ]; then
  cd code-base/

  if [ -f ".git/ref" ]; then
    commit=$(cat .git/ref)
    branch=$(git name-rev $commit | awk '{print $2;}')
  else
    branch=$(git config --get pullrequest.branch)
  fi

  cd ..
  echo "$branch"
else
  echo "Directory does not exist: $1";
  exit 1;
fi
