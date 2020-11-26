#!/bin/bash

branch_name=$(git symbolic-ref --short -q HEAD)
commit=$(date "+%Y.%m.%d")

echo | git add .
echo | git commit -m "$commit"
echo | git push origin "$branch_name"