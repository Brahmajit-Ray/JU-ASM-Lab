.MODEL SMALL
.STACK 100H

.DATA

ARRAY DB 9,8,7,6,5,4,3,2,1


.CODE

MAIN PROC

	MOV AX,@DATA
	MOV DS,AX
	
	MOV DX,8
	L1:
		MOV CX,DX
		MOV SI,OFFSET ARRAY
		L2:
		
            MOV AL,[SI]
			INC SI
            MOV BL,[SI]
			CMP AL,BL
            JLE L3                      
            MOV [SI],AL
			DEC SI
			MOV [SI],BL
            L3:
            INC SI
		LOOP L2

        DEC DX
        JNZ L1
		
	
	
	MOV SI,OFFSET ARRAY
	MOV CX,9
	
	L4:
		MOV DL,[SI]
		
		ADD DL,30H
		MOV AH,02H
		INT 21H
		
		MOV DL,32
		MOV AH,02H
		INT 21H
		
		
		INC SI
		LOOP L4
			
	MOV AH,4CH
	INT 21H

MAIN ENDP
END MAIN