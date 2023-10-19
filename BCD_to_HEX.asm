; 8051 code to get BCD to hex conversion for a byte data
; The BCD byte data is unpacked to perform the hex conversion. The unpacked number can be multipled with respective decimal weights to get Hex value.
; For example; BCD number 87h is unpacked as 08 and 07. 
;  Hex value = 08x0A + 09 = 59h 
; In general, any number xyz x represents 100th position, y represent 10th position and z is 1st position 
MOV A, #39H   ; Loading the BCD byte data for conversion 
LCALL UNPACK  ; function return the value in 20h and 21h location ; input parameter in A reg. 
MOV B, #0AH 
MOV A, 21H    ; multiply the higher byte of unpacked data with 0Ah 
MUL AB 
ADD A, 20H    ; hex equivalent in A reg.
HERE: SJMP HERE
UNPACK : MOV R1, A 
  ANL A, #0FH    ; mask the higher nibble 
  MOV 20H, A     ; store lower digit 
  MOV A, R1 
  ANL A, #0F0H   ; mask the lower digit 
  SWAP A         ; swap the digits 
  MOV 21H, A     ; store higher digit 
  RET 
END
