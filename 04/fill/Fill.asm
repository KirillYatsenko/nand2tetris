// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// ============= PSEUDO CODE ===============
//
// i = 0
// n = 32 (cols) * 256 (rows)
// fill = 0
//
// (POLL)
// 	if (KBD == 0)
// 		fill == 0
// 	else
// 		fill = -1
//
// 	for (i = 0; i < n; i++)
//		*(SCREEN + i) = fill
//
// 	JMP POLL
//
// =========================================

// n = 8192
@8192
D=A
@n
M=D
// i = 0
@i
M=0
// fill = 0
@fill
M=0

(POLL)
	// if KBD == 0 goto CLEAR
	@KBD
	D=M
	@CLEAR
	D; JEQ
	// fill = -1 (11111111 11111111)
	@fill
	M=-1
(SET)
	// i = 0
	@i
	M=0
(LOOP)
	// if i == n goto POLL
	@i
	D=M
	@n
	D=D-M
	@POLL
	D;JEQ
	// R0 = *(SCREEN + i)
	@SCREEN
	D=A
	@i
	D=D+M
	@R0
	M=D
	// *(R0) = fill
	@fill
	D=M
	@R0
	A=M
	M=D
	// i++
	@i
	M=M+1
	// goto LOOP
	@LOOP
	0; JMP
(CLEAR)
	// fill = 0
	@fill
	M=0
	// goto SET
	@SET
	0; JMP
