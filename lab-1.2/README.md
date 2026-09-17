# Laboratory Work 1.2

Laboratory work for the **Systemic Programming** course at **Vilnius University Šiauliai Academy**.

## Task

The assigned program must draw a **flower ring** using only the letters from the student's name and surname:

`Md Nahidul Islam`

The drawing must:

- begin from **line 3, column 10**
- use the letters one by one in the sequence `MDNAHIDULISLAM`
- repeat the sequence continuously until the drawing is completed
- use only letters that occur in the student's name and surname
- not use loops

## Requirements

The program:

- uses a data segment for the student's name and surname
- uses ASCII control codes for screen positioning
- uses `13,10` for carriage return and line feed
- uses spaces for horizontal positioning
- uses MS-DOS interrupts only
- uses `int 21h`
- uses function `09h` to display the complete flower drawing
- uses one output call for the complete drawing
- does not use loops
- contains comments explaining the program
- uses the student's own name and surname

## Development Environment

The source code was written and edited in **Visual Studio Code** and assembled, executed, and tested using **emu8086**.

## Source File

[1.2_lab_work_Islam.asm](./1.2_lab_work_Islam.asm)

## Running the Program

1. Open `1.2_lab_work_Islam.asm` in **emu8086**.
2. Select **Compile and Emulate**.
3. Run the program.
4. Verify that the flower drawing begins at line 3, column 10.
5. Verify that the letters follow the sequence `MDNAHIDULISLAM`.

## Expected Output

The program produces a flower-shaped ring using the letters of:

`MDNAHIDULISLAM`

The first visible character begins at **line 3, column 10**.

The sequence continues one by one throughout the drawing:

`M D N A H I D U L I S L A M`

After the last letter `M`, the sequence starts again from `M`.

## Notes

ASCII `13,10` is used for line changes. Two pairs move the output to line 3, while nine spaces place the first character at column 10.

The program is written in **8086 Assembly** for a DOS-compatible environment. It uses MS-DOS interrupt `21h` for output and program termination.