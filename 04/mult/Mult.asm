// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// ============= PSEUDO CODE ===============
//
// mul = 0
// i = 0
//
// (LOOP)
// 	i == R1; JMP STOP
// 	mul = mul + R0
// 	JMP LOOP
// (STOP)
// 	R2 = mul
// (END)
// 	JMP END
//
// =========================================

	// mul = 0
	@mul
	M=0
	// i = 0
	@i
	M=0
(LOOP)
	// if i == R1 goto STOP
	@i
	D=M
	@R1
	D=D-M
	@STOP
	D;JEQ
	// mul = mul + R0
	@mul
	D=M
	@R0
	D=D+M
	@mul
	M=D
	// i = i + 1
	@i
	M=M+1
	@LOOP
	0;JMP
(STOP)
	// R2 = mul
	@mul
	D=M
	@R2
	M=D
(END)
	@END
	0;JMP
