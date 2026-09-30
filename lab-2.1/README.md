# Laboratory Work 2.1 — Conditions and Loops in 8086 Assembly

Laboratory work for the **Systemic Programming** course at **Vilnius University Šiauliai Academy**.

**Student:** Md Nahidul Islam  
**Group:** PS24A  
**Environment:** EMU8086 / TASM, 16-bit x86 Assembly

## Task

The program reads **two pairs of row and column coordinates** from the keyboard.

- Beginning from the **first coordinate pair**, it prints `Md Nahidul` **five times vertically in the same column**.
- Beginning from the **second coordinate pair**, it prints `Islam` **seven times horizontally on the same line**.
- The program uses **conditions and loops**.
- The student's name and surname are declared in the `.data` segment as **individual letters**.

## Input

The program asks for four values:

```text
Enter 1st row (1-21):
Enter 1st column (1-71):
Enter 2nd row (1-25):
Enter 2nd column (1-40):
```

The ranges ensure that the required text fits inside the 80×25 text screen.

Invalid values are rejected and the program asks for the value again.

## Test Input

The main test used for the laboratory report is:

```text
1st row:     3
1st column:  10
2nd row:     15
2nd column:  20
```

With these coordinates:

- `Md Nahidul` starts at **row 3, column 10** and is printed five times downward.
- `Islam` starts at **row 15, column 20** and is printed seven times across the same row.

## Program Structure

The program uses the **small memory model** with separate `.data` and `.code` segments.

Main parts of the program:

- `readnumber` — reads and converts a one- or two-digit decimal value from the keyboard.
- Input validation — uses `cmp` with conditional jumps to check coordinate ranges.
- `setcursor` — moves the cursor to the requested screen coordinate.
- `printname` — prints `Md Nahidul` from individual letters.
- `printsurname` — prints `Islam` from individual letters.
- `loop` instructions — control the five vertical repetitions, seven horizontal repetitions, and character-by-character output.

## Interrupts Used

The program uses:

- `int 21h`, `ah = 09h` — prints `$`-terminated prompt strings.
- `int 21h`, `ah = 0Ah` — buffered keyboard input.
- `int 21h`, `ah = 02h` — prints individual characters.
- `int 21h`, `ah = 4Ch` — terminates the program.
- `int 10h`, `ah = 00h` — sets 80×25 text mode and clears the screen.
- `int 10h`, `ah = 02h` — sets the cursor position.

## Files

```text
2.1_lab_work_Islam.asm              Assembly source code
2.1_lab_work_Islam.docx             Laboratory report
2.1_lab_work_Islam_flowchart.drawio Editable program flowchart
README.md                            Project description
```

## Running in EMU8086

1. Open `2.1_lab_work_Islam.asm` in EMU8086.
2. Compile and emulate the program.
3. Enter the four requested coordinates.
4. After the final value is accepted, the screen is cleared.
5. Check that the name appears five times vertically and the surname seven times horizontally from the entered positions.


## Notes

This program is written in **8086 Assembly** and targets a DOS-compatible environment.

The source code is kept in the repository, while generated build files are not tracked because they can be recreated using emu8086.