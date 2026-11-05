#!/bin/sh
# Downloader.

set -euo pipefail

user_repos=$(./bin/repositories.py)
for user_repo in $user_repos
do
  if [[ -d $user_repo ]]
  then
    cd $user_repo

    git pull

    cd - > /dev/null
  else
    gh repo clone $user_repo
  fi
done
