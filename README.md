<div align="center">

# Systemic Programming Labs

**8086 assembly exercises for the Systemic Programming course at Vilnius University.**

`x86 Assembly` · `MS-DOS interrupts` · `emu8086`

</div>

This repository collects source code and supporting notes for low-level programming laboratory work. Each lab has its own directory and explains the assignment, implementation constraints, execution steps, and expected output.

## Labs

| Lab | Topic | Status |
| --- | --- | --- |
| [1.2](lab-1.2/) | ASCII control codes, fixed screen positions, and DOS interrupt `21h` | Complete |

## Environment

The current source targets a DOS-compatible 8086 environment and was assembled and tested with **emu8086**.

To run Lab 1.2:

1. Open `lab-1.2/1.2_lab_work_Islam.asm` in emu8086.
2. Choose **Compile and Emulate**.
3. Run the program.
4. Compare the text positions with the lab README.

## Repository convention

```text
lab-<number>/
├── *.asm       Assembly source
└── README.md   Task, constraints, execution, and expected output
```

Generated emulator artifacts are not tracked because they can be recreated from the source.

## License

No license is currently declared. All rights are reserved by default.
