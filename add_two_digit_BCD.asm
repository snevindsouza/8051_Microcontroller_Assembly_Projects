; 8051 assembly language program to add 10 two digit BCD numbers
MOV R0, #20H    ; location to access numbers to be added
MOV R3, #10     ; count values of numbers to be added 
CLR A           ; lower byte result of addition 
MOV R2, A       ; higher byte result of addition 
UP: ADD A, @R0
    DA A        ; decimal adjust after addition 
    JNC SKIP    ; check for the carry bit 
    XCH A, R2   ; update the carry in higher byte 
    ADD A, #01  ; INC doesn’t update carry flag , so ADD instruction is used
    DA A        ; update the decimal value in higher byte
    XCH A, R2
SKIP: INC R0    ; pointer to the next value for addition
    DJNZ R3, UP 
END 
