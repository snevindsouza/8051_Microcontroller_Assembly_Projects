; DPTR is used as a memory pointer for the external data memory. 
; MOVX instruction is used to achieve the data transfer. 
MOV R2, #21H    ; Store the higher byte of DPTR (DPH &DPL) ( 2100) 2100,2101,2102….. 
MOV R3, #57H    ; store the higher byte of DPTR (5700) 5700,5701,….. 
MOV R4, #10     ; Counter for 10 data bytes to transfer 
MOV DPTR, #2100H 
UP: MOVX A, @DPTR   ; reads the ex-memory 
    MOV DPH, R3     ; Changing to destination address of DPTR (higher byte) 
    MOVX @DPTR, A   ; transfer byte 
    MOV DPH, R2     ; Changing to source address 
    INC DPTR        ; This increments the DPTR (specially the lower byte !) 
    DJNZ R4, UP 
END