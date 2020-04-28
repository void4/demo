

org 100h                        ;specify .COM file

start:
  mov     al,13h          ;AX=0000 at program start
  int     10h             ;init mode 13h
  push    word 0A000h     ;Requires 80186 or higher to PUSH IMMED
  pop     es              ;ES now points to mode 13h screen segment

mainloop:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This is where you do your mega-amazing tiny program.
;Write 8-bit values to A000:0000 to draw some pixels.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov ah, 09h
  mov dx, text
  int 21h


  ;Check for user wanting to leave by pressing ESC
  in      al,60h          ;read whatever is at keyboard port; looking for ESC which is #1
  dec     al              ;if ESC, AL now 0
  jnz     mainloop        ;fall through if 0, jump otherwise
  mov     al,03           ;AX=0000 due to mainloop exit condition
  int     10h             ;Switch back to text mode as a convenience
  ret                     ;.COM files can exit with RET

text:
  db 'Hello world!$'
