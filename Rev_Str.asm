.MODEL SMALL
.STACK 100H

.DATA
VAR2 DB "REVERSE STRING:$",10,13
VAR1 DB "TAXI$"

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

MOV DX,OFFSET VAR2
MOV AH,09H
INT 21H


MOV SI,OFFSET VAR1
MOV CX,04H

L1:
	MOV BX,[SI]
	PUSH BX
	INC SI
	
LOOP L1 

MOV CX,04H

L2:

	POP DX
	MOV AH,02H
	INT 21H

LOOP L2

MAIN ENDP
END MAIN
