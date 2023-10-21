; Sort batch 1 data
MOV R3,#10 				
DEC R3 						
NEXT_2: MOV R0,#10H 	
		MOV R2,03H 			
NEXT_1:	MOV A,@R0 			
		INC R0
 		MOV 40H,@R0
		CJNE A,40H,CHECK 	
CHECK: 	JC NO_EXCHANGE 		
		XCH A, @R0 			
		DEC R0 				
		MOV @R0,A
		INC R0
NO_EXCHANGE: DJNZ R2, NEXT_1 
			 DJNZ R3, NEXT_2
; save batch 1 data			  
MOV R0,#10H 
MOV R1,#20H 
MOV R5,#0AH 
UP: MOV A,@R0 
	MOV @R1,A
	INC R0
	INC R1
	DJNZ R5, UP
; sort batch 2 data
MOV R3,#10 				
DEC R3 						
NEXT_4: MOV DPTR,#1000H 	
		MOV R2,03H 			
NEXT_3:	MOVX A,@DPTR			
		INC DPTR
		MOV @R0, A
		MOVX A, @DPTR
 		MOV @R1, A
		MOV A, @R0
		MOV 40H, @R1
		CJNE A, 40H, CHECK1 	
CHECK1: JNC NO_EXCHANGE1 		
		XCH A, @R1 			
		DEC DPL 				
		MOVX @DPTR,A
		INC DPTR
		MOV A, @R1
		MOVX @DPTR, A  
NO_EXCHANGE1: DJNZ R2, NEXT_3 
			  DJNZ R3, NEXT_4
;sort batch 2 data
MOV R2, #10H 
MOV R3, #20H 	
MOV R4, #10 
MOV DPTR, #1000H
down: MOVX A,@DPTR 	
	MOV DPH, R3 
	MOVX @DPTR, A 	
	MOV DPH, R2 	
	INC DPTR 		
	DJNZ R4, down																  
END
