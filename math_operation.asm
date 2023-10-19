;Implementation of z=((x^2)+y)/4 Where x and y are single digit numbers
MOV R1, #X       ; load the value of X 
MOV R2, #Y       ; load the value of Y 
LCALL SQUARE 
ADD A, R2        ; Perfom X2+Y 
MOV B, #04 
DIV AB           ; Perform (X2+Y)/4 
HERE: SJMP HERE  ; infinitely loop to terminate the code and the value of Z is stored in A reg. 

; Function definition begins 
SQUARE: MOV A, R1 
  MOV B, A 
  MUL AB         ; perform X2
  RET 
END
