#!/bin/sh

revision="$(git rev-parse HEAD)"
filesChanged="$(git show ${revision} --name-only --pretty='oneline')"
filesToMatch=".js"
divider="***********************************************************************\n"

if `echo ${filesChanged} | grep "${filesToMatch}" 1>/dev/null 2>&1`
  then
    echo "${divider}Your Message here when a matched file has been checked in...\n${divider}"
    cd path/to/code/
    npm run eslint && npm test
    cd -
    echo "\n${divider}Checks Complete"
  else
    echo "No changes detected, pushing as normal"
fi