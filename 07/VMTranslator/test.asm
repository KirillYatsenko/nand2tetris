// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
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
@test.0.__EQ
D;JEQ 
@SP
A=M-1
M=0
@test.0.__EQ_EXIT
0;JMP
(test.0.__EQ)
@SP
A=M-1
M=-1
(test.0.__EQ_EXIT)
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@test.1.__GT
D;JGT 
@SP
A=M-1
M=0
@test.1.__GT_EXIT
0;JMP
(test.1.__GT)
@SP
A=M-1
M=-1
(test.1.__GT_EXIT)
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@test.2.__LT
D;JLT 
@SP
A=M-1
M=0
@test.2.__LT_EXIT
0;JMP
(test.2.__LT)
@SP
A=M-1
M=-1
(test.2.__LT_EXIT)
