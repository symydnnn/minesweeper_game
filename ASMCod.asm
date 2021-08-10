include 'emu8086.inc'
   
   
   
org 100h

mov al,0h
mov ah,0   
int 10h 
mov ax,0600h  
mov bh,71h   
mov cx,0H   
mov dx,184Fh  
int 10h  

printn
printn '     MAYIN TARLASI OYUNU'


mov ax,0
int 33h
mov ax,1
int 33h  

mov [bx],00h 


grafik:
    mov dl,0 
    gotoxy 5,5
    putc 201
    mov cx, 0

    tekrar:
    putc 205
    putc 203  
    inc cx 
    cmp cx, 8h
    jne tekrar
    putc 205
    putc 187   
    mov [si],6                
                  
    arasegme: 
    mov cx,0
    gotoxy 5, [si]
    putc 186  
    inc [si]
 
    tekrar3:
    inc cx
    putc [bx]
    putc 186
    cmp cx,9h
    jne tekrar3 
    gotoxy 5, [si]
    putc 204
    mov cx,0

    tekrar1: 
    putc 205
    putc 206
    inc cx
    cmp cx,8h
    jne tekrar1
    putc 205
    putc 185 
    inc [si]   
    cmp [si],12h 

    jne arasegme   
    mov cx,0
    GOTOXY 5, [si]
    PUTC 186  
    inc [si]
 
    tekrar4:
    inc cx  
    mov ax,3
    putc [bx]
    putc 186
    cmp cx,9h
    jne tekrar4        
        
    gotoxy 5,19
    putc 200
    mov cx,0

    tekrar2:
    putc 205
    putc 202
    inc cx
    cmp cx,8h
    jne tekrar2
    putc 205
    putc 188 
  
inc dl
cmp dl,0
je grafik


   mov di,0 
   
   kazan:
   cmp di,6
   je kazanan
   
fare:
    mov ax,3
    int 33h  
    cmp bx,1
    jne fare  
    
    call sekme1
    iki: 
    call sekme2 
    uc:
    call sekme3
    dort:
    call sekme4 
    bes:
    call sekme5
    alti:
    call sekme6  
    yedi:
    call sekme7
    sekiz:
    call sekme8  
    dokuz:
    call sekme9
    bomba:
    call bombakonum
    ret 
     
    
    sekme1:
    cmp cx,30h
    jl iki   
    cmp cx,59h
    jg iki
    cmp dx,30h
    jl iki
    cmp dx,49h
    jg iki
    call dongu1
    ret
      
    sekme2:
    cmp cx,60h
    jl uc
    cmp cx,79h
    jg uc 
    cmp dx,30h
    jl uc
    cmp dx,59h
    jg uc
    call dongu2
    ret 
    
    sekme3:
    cmp cx,30h
    jl dort
    cmp cx,59h
    jg dort 
    cmp dx,50h
    jl dort
    cmp dx,89h
    jg dort 
    call dongu3
         
    
    sekme4:
    cmp cx,80h
    jl bes
    cmp cx,119h
    jg bes 
    cmp dx,30h
    jl bes
    cmp dx,79h
    jg bes
    call dongu4
    ret  
    
    sekme5:
    cmp cx,60h
    jl alti
    cmp cx,79h
    jg alti 
    cmp dx,60h
    jl alti
    cmp dx,79h
    jg alti 
    call dongu5 
    ret
    
     
    sekme6:
    cmp cx,80h
    jl yedi
    cmp cx,119h
    jg yedi 
    cmp dx,80h
    jl yedi
    cmp dx,99h
    jg yedi 
    call dongu6
    ret   
    
    sekme7:
    cmp cx,50h
    jl sekiz
    cmp cx,119h
    jg sekiz 
    cmp dx,90h
    jl sekiz
    cmp dx,99h
    jg sekiz  
    call dongu6
    ret 
    
    sekme8:
    cmp cx,60h
    jl dokuz
    cmp cx,69h
    jg dokuz 
    cmp dx,80h
    jl dokuz
    cmp dx,89h
    jg dokuz 
    call dongu5
    ret
    
    sekme9:
    cmp cx,30h
    jl bomba
    cmp cx,49h
    jg bomba
    cmp dx,90h
    jl bomba
    cmp dx,99h
    jg bomba 
    call dongu3
    ret   
    
    bombakonum:
    cmp cx,70h
    jl kazan
    cmp cx,79h
    jg kazan 
    cmp dx,80h
    jl kazan
    cmp dx,89h
    jg kazan 
    jmp patladi
    ret 
    
           
    dongu1:
    inc di
    mov [si],6 
    don2: 
    mov [bx],6
    d3:
    gotoxy [bx],[si]
    putc 048 
    putc 186
    add [bx],2
    cmp [bx],12 
    jne d3 
    add [si],2
    cmp [si],10
    jne don2
    ret  
    
    dongu2: 
    inc di
    mov [si],6
    don1:
    gotoxy 12,[si]
    putc 051 
    putc 186  
    putc 051 
    putc 186
    add [si],2 
    cmp [si],12
    jne don1
    ret  
    
    dongu3:
    inc di
    mov [si],10 
    don:  
    mov [bx],6
    d4:
    gotoxy [bx],[si]
    putc 049 
    putc 186  
    add [bx],2
    cmp [bx],12 
    jne d4
    add [si],2
    cmp [si],18      
    jne don  
    gotoxy 6,18
    putc 049 
    putc 186  
    putc 049 
    putc 186
    ret
    
    dongu4: 
    inc di
    mov [si],6
    don3:
    mov [bx],16
    d:
    gotoxy [bx],[si]
    putc 050
    putc 186 
    add [bx],2
    cmp [bx],24 
    jne d  
    add [si],2
    cmp [si],16
    jne don3 
    ret
    
    dongu5:
    inc di
    mov [si],12
    don4:  
    gotoxy 12,[si]
    putc 052
    putc 186
    putc 052
    putc 186
    add [si],2
    cmp [si],16
    jne don4
    gotoxy 12,16
    putc 052
    putc 186
    ret
        
    dongu6:
    inc di 
    mov [bx],10
    don6:
    gotoxy [bx],18
    putc 048   
    putc 186 
    inc [bx]
    inc [bx]
    cmp [bx],16
    jne don6
    mov [si],16
    don5:
    mov [bx],16
    d2:
    gotoxy [bx],[si]
    putc 048
    putc 186 
    add [bx],2
    cmp [bx],24 
    jne d2
    add [si],2
    cmp [si],20 
    jne don5
    ret
     
    patladi:
    mov ax,0600h
    mov bh,31h   
    mov cx,0h   
    mov dx,184fh
    int 10h   
       
    printn 'BOMBA PATLADI!'
    
    mov ah,4ch 
    int 21
    ret  
    
    kazanan:
    mov ax,0600h
    mov bh,47h   
    mov cx,0h   
    mov dx,184fh
    int 10h   
       
    printn 'KAZANDINIZ!'
    
    mov ah,4ch 
    int 21
    ret 
     
      
end 


