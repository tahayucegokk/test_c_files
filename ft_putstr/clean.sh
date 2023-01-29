#!/bin/bash

files=$(find . -name "*_fail")

rm -rf test.c
rm -rf a.out
rm -rf file1
rm -rf file2
rm -rf capture_1.txt
rm -rf capture_2.txt

if [ -n "$files" ]; then
  for file in $files
  do
    rm $file
    rm -rf *_passed
    touch fail
    exit 1
  done
else
  rm -rf *_fail
  rm -rf *_passed
  touch passed
fi
