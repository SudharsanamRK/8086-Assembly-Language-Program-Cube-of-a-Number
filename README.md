# 8086-Assembly-Language-Program-Cube-of-a-Number

### Aim
To write and execute an 8086 Assembly Language Program (ALP) to find the cube of a given number.

### Apparatus Required
- Personal Computer with DOSBox
- MASM/TASM Assembler
- 8086 Emulator Environment

### Algorithm
1. Start the program.
2. Initialize the Data Segment.
3. Display a message asking the user to enter a digit.
4. Accept the digit input (0–9) from keyboard.
5. Convert the ASCII input to its numeric equivalent.
6. Multiply the number by itself twice to find the cube (n * n * n).
7. Display the cube of the number.
8. Exit the program.

### Program Code
```asm
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
```

### Flowchart didgram
<img width="1024" height="1024" alt="image" src="https://github.com/user-attachments/assets/99350be9-0ab1-4704-a7a7-5c1baa57ddbe" />


### Execution Commands (DOSBox)
```bash
masm cubenum.asm;
link cubenum.obj;
cubenum.exe
```
### Manual Calculation

Input: 3

Steps:

1. User enters ASCII '3' → convert to number: 3.
2. Cube calculation:
   ```nginx
   num * num * num
   3 * 3 * 3 = 27
   ```
3. Display:
   ```ini
   Cube = 27
   ```

### Sample Output
```cpp
Enter a digit (0-9): 2
Cube = 8
```

### Ouput
![8086-Cube-Program-Output](https://github.com/user-attachments/assets/e9eddba3-e947-4b0b-a17a-46df2ec705ee)

### Result
Thus, the 8086 Assembly Language Program to find the cube of a number was executed successfully.
