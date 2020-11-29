#!/bin/bash

branch_name=$(git symbolic-ref --short -q HEAD)
commit=$(date "+%Y-%m-%d %H:%M:%S")

echo | git pull --ff-only
echo | ./convert
echo | git add .
echo | git commit -m "$commit"
echo | git push origin "$branch_name"