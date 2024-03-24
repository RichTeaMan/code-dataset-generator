#!/bin/bash

REPO_NAMES=$(gh repo list --source --json name --limit 500 | jq .[].name --raw-output)

mkdir repos
for REPO_NAME in $REPO_NAMES; do
    #echo $REPO_NAME
    SSH_URL="git@github.com:RichTeaMan/$REPO_NAME.git"
    git -C repos clone $SSH_URL > /dev/null
done

./build_data.sh
