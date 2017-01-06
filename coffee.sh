#!/bin/bash

# configuration
repo=~/.coffee/tracker
file=consumed

# variables
filename=${repo}/${file}
current=${PWD}

# git specific
tracker_exists()
{
  git rev-parse --abbrev-ref HEAD > /dev/null
  return $?
}

init()
{
  mkdir -p $repo
  cd $repo
  git init -q .
  echo "0" > ${filename}
  git commit -q -am "initial commit"
  cd $current
}

commit()
{
  cd $repo
  git commit -q -am "uplifted"
  cd $current
}

# coffee counter
uplift()
{
  old=$(cat $filename)
  new=$((old + 1))
  echo $old
  echo $new
  echo $filename
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
  ("init") init ;;
  ("up") uplift ;;
  ("log") log ;;
  (*) usage ;;
esac
