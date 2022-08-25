// bootstrap
@256
D=A
@SP
M=D
// push retAddr
@boot$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP - 5 - nargs
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Sys.init
0;JMP
// ret label
(boot$ret.0)
// function SimpleFunction.test 2
(SimpleFunction.test)
// push zero #0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push zero #1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@LCL
D=M
@1
A=D+A
D=M
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
// not
@SP
A=M-1
M=!M
// push argument 0
@ARG
D=M
@0
A=D+A
D=M
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
// push argument 1
@ARG
D=M
@1
A=D+A
D=M
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
// return
// frame(R13) = LCL
@LCL
D=M
@R13
M=D
// retAddr(R14) = *(frame - 5)
@5
A=D-A
D=M
@R14
M=D
// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D
// SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// THAT = *(--frame)
@R13
AM=M-1
D=M
@THAT
M=D
// THIS = *(--frame)
@R13
AM=M-1
D=M
@THIS
M=D
// ARG = *(--frame)
@R13
AM=M-1
D=M
@ARG
M=D
// LCL = *(--frame)
@R13
AM=M-1
D=M
@LCL
M=D
// goto retAddr
@R14
A=M
0;JMP
// end
(__END)
@__END
0; JMP
