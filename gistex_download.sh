#!/usr/bin/env bash

STR=`sed -e 's/https:\/\/gist.github.com\/\(.*\).git/\1/' <<< "$1"`
SCRIPTDIR=$PWD
if [ -d /tmp/latexgist ]; then
  echo "already exists"
else
  mkdir /tmp/latexgist
fi

if [ -d /tmp/latexgist/$STR ]; then
  echo "already copied"
else
  mkdir /tmp/latexgist/$STR
  git clone $1 /tmp/latexgist/$STR
  cd /tmp/latexgist/$STR
  "cat" `ls -d "$PWD"/*` > $SCRIPTDIR/.tempgist
fi

#rm -rf /tmp/latexgist
