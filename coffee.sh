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
  if [ -f "$filename" ]; then
    return
  fi
  mkdir -p $repo
  cd $repo
  git init -q .
  echo "0" > $filename
  git add -A
  cd $current
  echo "ready to track your coffee addiction"
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
  echo "  --- : ----------------------------------------"
  git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c
  first=`git log $(git rev-list HEAD | tail -n 1) | grep Date | awk '{print ""$4" "$3" "$6}'`
  echo "  --- : ----------------------------------------"
  printf "  %-3s : TOTAL (since %s)\n" $(cat $filename) "$first"
  echo "  --- : ----------------------------------------"
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
