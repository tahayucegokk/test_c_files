#!/bin/bash

includes=$(grep -o '#include.*' ft_putstr.c)

# include edilen dosyaları kontrol et
if [[ $includes != *"<unistd.h>"* ]]; then
  touch test1_fail
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

cat main.c > main2.c

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
}' >> main2.c

gcc -Wall -Wextra -Werror test.c > /dev/null 2>&1

gcc_exit_code=$?
if [ $gcc_exit_code -ne 0 ]; then
  touch test2_fail
  exit 1
fi

touch test2_passed

gcc test.c -o file1

gcc main2.c -o file2

# ilk c dosyasını çalıştır ve çıktısını capture_1.txt dosyasına yazdır
./file1 > capture_1.txt

# ikinci c dosyasını çalıştır ve çıktısını capture_2.txt dosyasına yazdır
./file2 > capture_2.txt

diff capture_1.txt capture_2.txt

if [ $? -eq 0 ]
then
  touch test3_passed
else
  touch test3_fail
  exit 1
fi
