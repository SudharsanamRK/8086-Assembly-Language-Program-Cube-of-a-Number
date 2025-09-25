; Program to find cube of a number

DATA SEGMENT
    MSG1 DB 'Enter a digit (0-9): $'
    MSG2 DB 0DH,0AH,'Cube = $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H        
    MOV BL, AL

    MOV AL, BL
    MUL BL             
    MUL BL             

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
