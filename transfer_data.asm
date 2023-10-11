; In this program R0 and R1 registers are used as memory pointers. A count values in register R5 is loaded to repeat the data transfer recursively. 
MOV R0,#10H 	; SOURCE MEMORY 
MOV R1,#20H 	; DESTINATION MEMORY 
MOV R5,#0AH 	; COUNTER 
UP: MOV A, @R0 	; DATA TRANSFER OF A BYTE 
	MOV @R1, A 
	INC R0 
	INC R1 
	DJNZ R5, UP ; REPEAT THE PROCESS 
END
