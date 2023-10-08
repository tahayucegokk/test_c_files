#!/bin/bash

includes=$(grep -o '#include.*' ft_putstr.c)
# Check all included files.
if [[ $includes != *"<unistd.h>"* ]]; then
  touch test1_fail
  bash clear.sh
  exit 1
fi

touch test1_passed


cat ft_putstr.c > test.c

echo 'int main() {
  ft_putstr("Test1");
  ft_putstr("Test2");
  ft_putstr("Test3");
  ft_putstr("Test4");
  ft_putstr("Test5");
  ft_putstr("Test6");
  ft_putstr("Test7");
  ft_putstr("00000");
  ft_putstr("00001");
  ft_putstr("10000");
  ft_putstr(".....");
  ft_putstr("2147483649");
  ft_putstr("-2147483649");
  return 0;
}' >> test.c

echo '
#include <unistd.h>

void    ft_putchar(char c)
{
        write (1, &c, 1);
}

void    ft_putstr(char *str)
{
        int i;

        i = 0;

        while (str[i])
        {
                ft_putchar(str[i]);
                i++;
        }
}
int main() {
  ft_putstr("Test1");
  ft_putstr("Test2");
  ft_putstr("Test3");
  ft_putstr("Test4");
  ft_putstr("Test5");
  ft_putstr("Test6");
  ft_putstr("Test7");
  ft_putstr("00000");
  ft_putstr("00001");
  ft_putstr("10000");
  ft_putstr(".....");
  ft_putstr("2147483649");
  ft_putstr("-2147483649");
  return 0;
}' >> main.c

gcc -Wall -Wextra -Werror test.c > /dev/null 2>&1

gcc_exit_code=$?
if [ $gcc_exit_code -ne 0 ]; then
  touch test2_fail
  bash clear.sh
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
  bash clear.sh
else
  touch test3_fail
  bash clear.sh
  exit 1
fi
