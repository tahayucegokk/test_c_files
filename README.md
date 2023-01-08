Testing Steps
The script searches for the #include statement in the ft_putstr.c file. If the <unistd.h> file is not included, the test1_fail file is created and the script exits. If the file is included, the test1_passed file is created.

The ft_putstr.c file is copied to the test.c file and a main() function is added to the test.c file. This function calls the ft_putstr() function and writes the any text. The program returns 0.

The test.c file is compiled using GCC with the -Wall, -Wextra, and -Werror flags. If the compilation fails, the test2_fail file is created and the script exits. If the compilation is successful, the test2_passed file is created.

The test.c file is compiled again and the resulting executable file is called file1. The main.c file is also compiled and the resulting executable file is called file2.

Both file1 and file2 are run and their output is written to the capture_1.txt and capture_2.txt files, respectively.

The difference between the capture_1.txt and capture_2.txt files is checked. If there is no difference, the test3_passed file is created. If there is a difference, the test3_fail file is created and the script exits.
