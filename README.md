# 8086 Assembly Language Program – Cube of a Number 

## Aim

To write and execute an 8086 Assembly Language Program (ALP) that computes the cube of a number and stores the result in memory.

## Apparatus Required

* Personal Computer with DOSBox Emulator
* MASM Assembler
* 8086 Emulator/Execution Environment

## Algorithm

1. Start the program.
2. Initialize registers with the input number.
3. Multiply the number by itself to get the square.
4. Multiply the square by the original number to get the cube.
5. Store the result at a predefined memory location (1200H).
6. Exit the program.
7. Verify the stored result using DEBUG.

## Flowchart
<img width="1024" height="1024" alt="image" src="https://github.com/user-attachments/assets/e9c26dd5-cbde-4ea8-ad0f-630bbd27e9f4" />



## Program Code

```asm
CODE SEGMENT
ASSUME CS:CODE, DS:CODE
ORG 1000H

START:
   MOV AL, 03H       ; Load input number = 3
   MOV BL, AL        ; Copy input into BL
   MUL BL            ; AX = AL * BL = 3 * 3 = 9
   MOV CX, AX        ; Save square in CX
   MOV AX, CX        ; Reload AX = 9
   MUL BL            ; AX = AX * BL = 9 * 3 = 27
   MOV SI, 1200H     ; Set memory location
   MOV [SI], AX      ; Store result low word at 1200H
   MOV [SI+2], DX    ; Store high word at 1202H
   MOV AH, 4CH       ; Exit program
   INT 21H

CODE ENDS
END START
```

## Execution Commands (in DOSBox)

```bash
masm cubenum.asm;
link cubenum.obj;
debug cubenum.exe
```

Inside DEBUG:

* Run program from offset `1000H`:

  ```
  -g=1000
  ```
* Dump memory at `1200H` to check result:

  ```
  -d 1200
  ```

## Output
<img width="629" height="200" alt="image" src="https://github.com/user-attachments/assets/e7b0fb8e-4295-4095-a7bd-bf65160807cf" />


## Output Verification

Memory dump after execution:

```
-d 1200
075A:1200  1B 00 00 00 ...
```

* At **1200H**: `1B 00` → hexadecimal **001Bh**.
* Decimal equivalent = **27**.
* This confirms that the cube of `3` was correctly calculated and stored.

## Sample Calculation

**Input:** 3

**Computation:** 3 × 3 × 3 = 27

**Stored Result:** 001Bh (hexadecimal) at memory location 1200H.

## Result

Thus, the 8086 Assembly Language Program successfully computed the cube of a given number and stored the result in memory, verified using DEBUG.
