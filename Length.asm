.MODEL SMALL
.STACK 100H

.DATA

VAR1 DB "Input text:$",13
VAR2 DB 50 DUP('$')
VAR3 DB 10,13,"Length of string:$"

.CODE

MAIN PROC

	MOV AX,@DATA
	MOV DS,AX

	MOV DX,OFFSET VAR1
	MOV AH,09H
	INT 21H

    MOV CX,0
	
	MOV SI,OFFSET VAR2
	CALL TEXT
	
	MOV AH,4CH
	INT 21H

	MAIN ENDP

TEXT PROC

    INPUT:	
		
		MOV AH,01H
		INT 21H			

		CMP AL,13
		JE TER
		
		MOV [SI],AL		
		INC SI
		INC CX
		JMP INPUT
	
	TER:
		MOV [SI],'$ '
		MOV BX,OFFSET VAR2
		MOV DX,BX
		MOV AH,09H
		INT 21H
		
		MOV DX,OFFSET VAR3
		MOV AH,09H
		INT 21H
		

		MOV DX,CX
		ADD DX,30H
		MOV AH,02H
		INT 21H
		
		RET
		
	
    TEXT ENDP

END MAIN