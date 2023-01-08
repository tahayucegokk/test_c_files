#!/bin/bash

includes=$(grep -o '#include.*' ft_putstr.c)

if [[ $includes != *"<unistd.h>"* ]]; then
  touch test1_fail
  exit 1
fi

touch test1_passed

cat ft_putstr.c > test.c
echo 'int main() {
  ft_putstr("asd");
  return 0;
}' >> test.c

gcc -Wall -Wextra -Werror test.c > /dev/null 2>&1

gcc_exit_code=$?
if [ $gcc_exit_code -ne 0 ]; then
  touch test2_fail
  exit 1
fi

touch test2_passed

gcc test.c -o file1

gcc main.c -o file2

./file1 > capture_1.txt

./file2 > capture_2.txt

diff capture_1.txt capture_2.txt

if [ $? -eq 0 ]
then
  touch test3_passed
else
  touch test3_fail
  exit 1
fi
