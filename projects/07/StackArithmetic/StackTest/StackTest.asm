// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.0.__EQ
D;JEQ
@SP
A=M-1
M=0
@StackTest.0.__EQ_EXIT
0;JMP
(StackTest.0.__EQ)
@SP
A=M-1
M=-1
(StackTest.0.__EQ_EXIT)
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.1.__EQ
D;JEQ
@SP
A=M-1
M=0
@StackTest.1.__EQ_EXIT
0;JMP
(StackTest.1.__EQ)
@SP
A=M-1
M=-1
(StackTest.1.__EQ_EXIT)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.2.__EQ
D;JEQ
@SP
A=M-1
M=0
@StackTest.2.__EQ_EXIT
0;JMP
(StackTest.2.__EQ)
@SP
A=M-1
M=-1
(StackTest.2.__EQ_EXIT)
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.0.__LT
D;JLT
@SP
A=M-1
M=0
@StackTest.0.__LT_EXIT
0;JMP
(StackTest.0.__LT)
@SP
A=M-1
M=-1
(StackTest.0.__LT_EXIT)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.1.__LT
D;JLT
@SP
A=M-1
M=0
@StackTest.1.__LT_EXIT
0;JMP
(StackTest.1.__LT)
@SP
A=M-1
M=-1
(StackTest.1.__LT_EXIT)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.2.__LT
D;JLT
@SP
A=M-1
M=0
@StackTest.2.__LT_EXIT
0;JMP
(StackTest.2.__LT)
@SP
A=M-1
M=-1
(StackTest.2.__LT_EXIT)
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.0.__GT
D;JGT
@SP
A=M-1
M=0
@StackTest.0.__GT_EXIT
0;JMP
(StackTest.0.__GT)
@SP
A=M-1
M=-1
(StackTest.0.__GT_EXIT)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.1.__GT
D;JGT
@SP
A=M-1
M=0
@StackTest.1.__GT_EXIT
0;JMP
(StackTest.1.__GT)
@SP
A=M-1
M=-1
(StackTest.1.__GT_EXIT)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@StackTest.2.__GT
D;JGT
@SP
A=M-1
M=0
@StackTest.2.__GT_EXIT
0;JMP
(StackTest.2.__GT)
@SP
A=M-1
M=-1
(StackTest.2.__GT_EXIT)
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M-D
// neg
@SP
A=M-1
M=-M
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M|D
// not
@SP
A=M-1
M=!M
(__END)
@__END
0; JMP
