.MODEL SMALL
.STACK 100H

.DATA 

NUM1 DW ? 

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AX,0
    
    MOV AL,99H
    MOV BL,99H
    
    ADD AL,BL
    DAA 
         
    MOV NUM1,AX
    
	JC L5
	L5:
	    MOV DX,1
	    ADD DX,30H
	    MOV AH,02H
	    INT 21H
    
    CALL PRINT
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP

PRINT PROC 
    MOV AX,NUM1
    MOV DX,0 
	MOV BX,16
	MOV CX,0 
	
	
	L3:
		DIV BX 
		PUSH DX 
		MOV DX,0  
		INC CX  
		CMP AX,0 
		JNE L3 
		
	L4:
		POP DX 
		ADD DX,48 
		MOV AH,02H 
		INT 21H 
		
	LOOP L4 
	
	RET 
	
PRINT ENDP

END MAIN
    