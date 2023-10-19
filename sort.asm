;8051 assembly code to sort the 10 data bytes in ascending order
MOV R3, #10  ; No of data bytes to be sorted 
DEC R3       ; for N numbers N-1 comparisons required 
NEXT_2: MOV R0,#10H   ; starting location of number 
        MOV R2,03H    ; count for inner loop 
NEXT_1: MOV A,@R0     ; read first value from memory 
        INC R0 
        MOV 30H,@R0 
        CJNE A,30H,CHECK   ; compare first location with Nth location 
CHECK:  JC NO_EXCHANGE     ; check for ascending pattern ;JNC for descending order sorting 
        XCH A, @R0         ; exchange the value between
        DEC R0             ; memory locations 
        MOV @R0,A 
        INC R0 
NO_EXCHANGE: DJNZ R2, NEXT_1 ; repeat for N-1 
             DJNZ R3, NEXT_2 ; outer loop N-1 
END
