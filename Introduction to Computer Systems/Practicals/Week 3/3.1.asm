.MODEL SMALL
.STACK 100
.DATA
	STR1	DB 0DH, 0AH, "Enter an uppercase(A - J): $"
	STR2    DB 0DH, 0AH, "The lowercase of the character entered is: $"
	VAR     DB ? 

.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	MOV AH, 09H
	LEA DX, STR1
	INT 21H
	
	MOV AH, 01H
	INT 21H
	MOV VAR, AL
	
	MOV AH, 09H
	LEA DX, STR2
	INT 21H
	
	MOV AH, 02H
	MOV DL, VAR
	ADD DL, 20H
	INT 21H
	
	MOV AH, 4CH
	INT 21H
MAIN ENDP
END MAIN