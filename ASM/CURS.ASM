code SEGMENT byte public
     ASSUME cs:code,ds:code,es:code,ss:code

  org 100h

begin:

  mov AH,1ah                 ;������� ��������� Disk Transfer Address (DTA)
  lea DX,DTA
  int 21h

  mov AH,4eh                 ;������� ������ ������� �����
  mov CX,27h                 ;�������� �����
  lea DX,FMask               ;����� �����
  int 21h                
  jnc @Con

  lea DX,err1                ;����� ������
  jmp @Exit

  @Con:

  mov AX,0013h               ;320�200�8
  int 10h                    ;������� � ����������� �����  

  mov AX,3d00h               ;������� �������� ����� ��� ������
  lea DX,FName              
  int 21h      
  jnc @Con3
  
  lea DX,err2                ;����� ������
  jmp @Exit

  @Con3:

  mov handle,AX

  lea DX,Buf
  mov BX,handle
  mov AH,3fh                 ;������� ������ �����
  mov CX,54                  ;������ ���������
  int 21h

  mov AX,word ptr [Buf+2]
  mov FSize,AX               ;�������� ������ �����
  mov AX,word ptr [Buf+18]
  cmp AX,320                 ;�������� ������ ��������, ��������� �� �������
  jle @Con1
  jmp @Next

  @Con1:
    mov x,AX                
  
  mov AX,word ptr [Buf+22]
  cmp AX,200                 ;�������� ������ ��������, ��������� �� �������
  jle @Con2  
  jmp @Next

  @Con2:
    mov y,AX                

  mov AX,x                   ;��������� � �� �������� 4
  and AX,3
   jz @x
  xor AX,3
  inc AX
  add x,AX

  @x:
    dec x

  lea DX,pal                 ;��������� ������� �� �����
  mov SI,256                
  @cp:
    mov AH,3fh
    mov BX,handle
    mov CX,4
    int 21h                 
    add DX,3
    dec SI
  jnz @cp

  mov SI,768                 ;������ ������� �����
  lea DX,pal
  @lp:
    mov AL,pal[SI-3]
   push AX
    mov AL,pal[SI-2]
   push AX
    mov AL,pal[SI-1]
    shr AL,2
    mov pal[SI-3],AL
    pop AX
    shr AL,2
    mov pal[SI-2],AL
    pop AX
    shr AL,2
    mov pal[SI-1],AL
    sub SI,3
  jnz @lp

  lea DX,pal                 ;��������� ������� ��������
  mov AX,DS
  mov ES,AX
  mov AX,1012h
  mov BX,0
  mov CX,256
  int 10h                   
  mov BX,handle

  mov AX,x                   ;������������� �������
  add AX,320
  shr AX,1
  mov x2,AX
  mov AX,y
  add AX,200
  shr AX,1
  mov DX,20
  mul DX
  add AX,0a000h
  mov ES,AX                  

  mov AX,y                   ;����� �������� �� �����
  mov c,AX 
  lea DX,Buf
  @cy:
    mov AX,x2
    sub AX,x
    mov DI,AX
    @cx:
      mov AH,3fh
      mov BX,handle
      mov CX,1
      int 21h
      mov AL,byte ptr [Buf]
      mov ES:[DI],AL
      inc DI
      cmp DI,x2
    jle @cx
      mov AX,ES
      sub AX,20
      mov ES,AX
      dec c
  jnz @cy
  
;  lea DX,FName
;  mov CX,12
;  mov AX,DS
;  mov ES,AX
;  mov AX,1300h
;  mov BP,DX
;  mov DX,0
;  mov BX,0ffh
;  int 10h
  
  mov BX,handle

  mov AH,1                   ;�������� �������
  int 21h

  @Next:

  mov AH,3eh                 ;������� �������� �����
  int 21h
   jc @Exit

  mov AH,4fh                 ;������� ������ ���������� �����
  lea DX,DTA
  int 21h
  lea DX,err0
   jc @Exit
  jmp @Con

  @Exit:

  mov AX,0003h               ;������� � ��������� �����
  int 10h

  mov AH,09h
  int 21h

  int 20h

   DTA db 30 dup (0)
 FName db 13 dup (0)
 FMask db '*.BMP',0
     x dw ?
    x2 dw ?
     y dw ?
     c dw ?
handle dw ?
 FSize dw ?
   Buf db 54 dup (?)
   Pal db 768 dup (?)
  err1 db 13,10,'File not found',13,10,'$' 
  err2 db 13,10,'File open error',13,10,'$' 
  err0 db 13,10,'All files were shown',13,10,'$' 

code ends

end begin 