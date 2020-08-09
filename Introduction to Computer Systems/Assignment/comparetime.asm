.DATA
    OLDMIN  DB 0
    
    NEWMIN  DB 0 
    
    DIFFMIN DB 0
    
    STR1    DB 0DH, 0AH, "TIME IS $"
    STR2    DB "MIN  $"  
    TEN     DB 10
    
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX


MOV AH, 2CH
INT 21H
MOV OLDMIN, CL

MOV AH, 01H
INT 21H


MOV AH, 2CH
INT 21H
MOV NEWMIN, CL

MOV AL, NEWMIN
SUB AL, OLDMIN
MOV DIFFMIN, AL

CMP DIFFMIN, 1
JB SUCCESS
JAE FAIL

SUCCESS:
MOV AH, 09H
LEA DX, STR1
INT 21H

JMP QUIT

FAIL:
MOV AH, 09H
LEA DX, STR2
INT 21H

QUIT:
MOV AH, 4CH
INT 21H

MAIN ENDP
END MAIN


