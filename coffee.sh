#!/bin/bash

# configuration
repo=~/.coffee/tracker
file=consumed

# variables
filename=${repo}/${file}
current=${PWD}

# git specific
init()
{
  mkdir -p $repo
  cd $repo
  git init -q .
  echo "0" > $filename
  git add -A
  cd $current
}

commit()
{
  cd $repo
  git add -A
  git commit -q -m "uplifted"
  cd $current
}

# coffee counter
uplift()
{
  old=$(cat $filename)
  new=$((old + 1))
  sed -e "s/${old}/${new}/g" ${filename} > ${filename}.tmp
  mv ${filename}.tmp ${filename}
}

# log
log()
{
  cd $repo
  git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c
  cd $current
}

usage()
{
  echo "Usage: $0 init | up | log" 1>&2
  exit 1
}

# main
case "$1" in
  ("init")  init;;
  ("up")    uplift; commit;;
  ("log")   log;;
  (*)       usage;;
esac
