#!/bin/bash

# How to use
# 1. git switch -c branch 'version-x.x.x' origin/main
# 2. sh auto-update-version.sh

branch_name=$(git branch --show-current)

if [[ $branch_name == version-* ]]; then
    # extract version from branch name
    version=$(echo $branch_name | cut -d'-' -f2)

    # update package.json with the new version
    npm version $version --no-git-tag-version

    # stage the changes
    git add package.json

    # commit the changes with a custom message
    git commit -m "🔖 버전을 v$version 으로 올려라"
fi
