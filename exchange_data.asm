; In this program R0 and R1 registers are used as memory pointers. R3 is used as a counter to repeat the data exchange between two locations 
MOV R0, #10H     ; MEMORY 1
MOV R1, #20H     ; MEMORY 2 
MOV R3, #10      ; COUNTER SET FOR 10 VALUES (0AH LOADED)
REPEAT MOV A, @R0   ; READ THE CONTENT OF MEMORY 1 
    XCH A, @R1      ; EXCHANGE WITH MEMORY 2 
    MOV @R0, A      ; YOU CAN ALSO USE “XCH A,@R0 “ 
    INC R0 
    INC R1 
    DJNZ R3, REPEAT
END