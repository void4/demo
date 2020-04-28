if nasm $1 -fbin -o main.com ; then
  ndisasm -o100h main.com
  stat --printf="%s bytes\n" main.com
  dosbox main.com -exit
fi
