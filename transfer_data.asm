; In this program R0 and R1 registers are used as memory pointers. A count values in register R5 is loaded to repeat the data transfer recursively. 
; We are going to transfer 10 data bytes from 10H to 20H locations
MOV R0,#10H 	; SOURCE MEMORY 
MOV R1,#20H 	; DESTINATION MEMORY 
MOV R5,#0AH 	; COUNTER 
UP: MOV A, @R0 	; DATA TRANSFER OF A BYTE 
	MOV @R1, A 
	INC R0 
	INC R1 
	DJNZ R5, UP ; REPEAT THE PROCESS 
END
