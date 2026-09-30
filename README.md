<div align="center">

# Systemic Programming Labs

**8086 assembly laboratory work for the Systemic Programming course at Vilnius University Šiauliai Academy.**

`8086 Assembly` · `EMU8086 / TASM` · `MS-DOS interrupts` · `conditions` · `loops`

</div>

This repository contains the source code, reports, flowcharts, and supporting notes for the Systemic Programming laboratory work. Each laboratory has its own directory with the assignment-specific implementation and documentation.

## Labs

| Lab | Topic | Main concepts | Status |
| --- | --- | --- | --- |
| [1.1](lab-1.1/) | Fixed-position text output | ASCII control codes, screen positioning, DOS `int 21h`, function `09h` | Complete |
| [1.2](lab-1.2/) | Flower ring from name and surname | Data blocks, ASCII control codes, formatted output, DOS `int 21h` | Complete |
| [2.1](lab-2.1/) | Conditions and loops | Keyboard input, validation, conditional jumps, loops, cursor positioning | Complete |

## Laboratory Work 2.1

Lab 2.1 reads two coordinate pairs from the keyboard.

- From the first pair, `Md Nahidul` is printed **five times vertically** in the same column.
- From the second pair, `Islam` is printed **seven times horizontally** on the same row.
- Coordinate values are validated before being accepted.
- The name and surname are stored in the data segment as individual letters.
- Conditions and loops are used to control validation and repetition.

The main test case uses:

```text
1st row:     3
1st column:  10
2nd row:     15
2nd column:  20
```

See [lab-2.1/README.md](lab-2.1/README.md) for the complete task description and execution details.

## Environment

The programs target a DOS-compatible 16-bit 8086 environment and are assembled and tested using **EMU8086 / TASM**.

Depending on the laboratory, the programs use MS-DOS and emulator-supported system interrupts for keyboard input, text output, cursor positioning, and program termination.

## Running a Lab

1. Open the required `.asm` file in **EMU8086**.
2. Select **Compile and Emulate**.
3. Run the program.
4. Enter keyboard input when the selected laboratory requires it.
5. Compare the result with the corresponding laboratory README and report.

## Repository Structure

```text
systemic_programming_labs/
├── lab-1.1/
│   ├── 1.1_lab_work_Islam.asm
│   └── README.md
├── lab-1.2/
│   ├── 1.2_lab_work_Islam.asm
│   └── README.md
├── lab-2.1/
│   ├── 2.1_lab_work_Islam.asm
│   ├── 2.1_lab_work_Islam.docx
│   ├── 2.1_lab_work_Islam_flowchart.drawio
│   └── README.md
└── README.md
```

Generated emulator and compiled artifacts are not tracked because they can be recreated from the assembly source.

## Course

**Systemic Programming**  
Vilnius University Šiauliai Academy  
Group **PS24A**

## License

No license is currently declared. All rights are reserved by default.
