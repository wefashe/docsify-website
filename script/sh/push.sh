#!/bin/bash
git add ../../
git commit -m " :memo: $(git config user.name) auto save at `date +%Y-%m-%d\ %H:%M:%S`"
git push -u origin master



