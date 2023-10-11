; Assembly program to add 10 data bytes stored in the internal RAM 10h onwards. 
; Store the result of addition in 20h (higher byte) and 21h (lower byte)
MOV R0, #10H    ; Memory pointer 
MOV R2, #10     ; Total numbers to be added 
CLR A           ; clear the lower byte of result 
UP: MOV 20H, A      ; Clear the higher byte of result 
    ADD A, @R0  ; Adding the number to Acc (A = A+@R0) 
    JNC SKIP    ; Check for carry flag 
    INC 21H     ; Update the higher byte of result on getting carry 
SKIP: INC R0 
    DJNZ R2, UP 
END