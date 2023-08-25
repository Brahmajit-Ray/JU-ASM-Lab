.MODEL SMALL
.STACK 100H

.DATA

VAR1 DB "INPUT NUMBER:$",13
VAR4 DB "DECIMAL:$",13
VAR2 DB "BINARY:$",10,13
VAR3 DB "HEX:$",10,13

.CODE

MAIN PROC
	MOV AX,@DATA
	MOV DS,AX 

	MOV DX,OFFSET VAR1
	MOV AH,09H
	INT 21H
	
	MOV AH,01H
	INT 21H
	
	MOV DX,OFFSET VAR4
	MOV AH,09H
	INT 21H
	
	MOV DL,AL
	MOV AH,02H
	INT 21H
		
	MOV AH,0
	MOV BX,2
	MOV DX,0
	MOV CX,0
	
	SUB AL,30H
	
	CALL BIN
	
	
	MOV AH,4CH
	INT 21H
	

MAIN ENDP

BIN PROC
		
	CONVERT:

        DIV BX
		PUSH DX
		INC CX	
		
		CMP AX,0
		JE PRINT
		
		
		JMP CONVERT
		
	PRINT:
		MOV DX,OFFSET VAR2
		MOV AH,09H
		INT 21H
		
		L1:
			POP DX
			ADD DX,30H
			MOV AH,02H
		    INT 21H
			
		LOOP L1
		
		RET
		
BIN ENDP

HEX PROC
		
	CONVERT1:

        DIV BX
		PUSH DX
		INC CX	
		
		CMP AX,0
		JE PRINT1
		
		
		JMP CONVERT1
		
	PRINT1:
		MOV DX,OFFSET VAR3
		MOV AH,09H
		INT 21H
		
		L2:
			POP DX
			ADD DX,30H
			MOV AH,02H
		    INT 21H
			
		LOOP L2
		
		RET
		
HEX ENDP

END MAIN
			
		
		
		
		
		
		
		
	
