nasm main.asm -fbin -o main.com
ndisasm -o100h main.com
stat --printf="%s bytes\n" main.com
dosbox main.com -exit
