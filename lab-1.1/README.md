# Laboratory Work 1.1

Laboratory work for the **Systemic Programming** course at **Vilnius University**.

## Task

The assigned program must:

1. Print the surname and name `Islam Md Nahidul` starting from **position 4 of line 19**, three times in the same column upward.
2. Print the surname `Islam` starting from **position 2 of line 12**, four times in the same column downward.
3. Print the name `Md Nahidul` at **line 8, position 7**.

Therefore, the final text appears at:

| Text | Lines | Column |
| --- | --- | ---: |
| `Md Nahidul` | 8 | 7 |
| `Islam` | 12–15 | 2 |
| `Islam Md Nahidul` | 17–19 | 4 |

## Requirements

The program:

- uses a data block for the output
- uses ASCII special/control codes
- uses MS-DOS interrupts only
- uses DOS interrupt `21h`
- uses function `09h` to display the text
- does not use loops
- contains comments explaining the program
- prints the complete output using one data block

## Development Environment

The source code was written and edited in **Visual Studio Code** and the program was assembled, executed, and tested using **emu8086**.

## Source File

[1.2_lab_work_Islam.asm](./1.1_lab_work_Islam.asm)

## Running the Program

1. Open `1.1_lab_work_Islam.asm` in **emu8086**.
2. Select **Compile and Emulate**.
3. Wait for the program to assemble successfully.
4. Run the program in the emulator.
5. Verify that the text appears at the required screen positions.

## Expected Output Positions

```text
Line 8,  Column 7  ->       Md Nahidul

Line 12, Column 2  ->  Islam
Line 13, Column 2  ->  Islam
Line 14, Column 2  ->  Islam
Line 15, Column 2  ->  Islam

Line 17, Column 4  ->    Islam Md Nahidul
Line 18, Column 4  ->    Islam Md Nahidul
Line 19, Column 4  ->    Islam Md Nahidul
```

## Notes

This program is written in **8086 Assembly** and targets a DOS-compatible environment.

The source code is kept in the repository, while generated build files are not tracked because they can be recreated using emu8086.