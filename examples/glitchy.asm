org 100h                        ;specify .COM file

start:
  mov     al,13h          ;AX=0000 at program start
  int     10h             ;init mode 13h
  les     bx,[bx]         ;contains 0x9FFF at program start; close enough to 0xA000 ;-)

mainloop:
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;This is where you do your mega-amazing tiny program.
  ;Write 8-bit values to ES:xxxx to draw some pixels.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov cx, 1
  X: cwd
  mov ax, di
  mov bx, 320
  div bx
  xor ax, dx
  and al, 32+8
  xor al, cl
  stosb
  add cx, 1
  jmp short X

  ;Check for user wanting to leave by pressing ESC
  in      al,60h          ;read whatever is at keyboard port; looking for ESC which is #1
  dec     al              ;if ESC, AL now 0
  jnz     mainloop        ;fall through if 0, jump otherwise
  ret                     ;.COM files can exit with RET
                          ;Don't care if we set text mode, user can just MODE CO80
