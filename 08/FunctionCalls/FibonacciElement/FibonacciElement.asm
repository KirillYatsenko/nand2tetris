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
// function Sys.init 0
(Sys.init)
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1   // computes the 4'th fibonacci element
// push retAddr
@Sys.init$ret.0
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
@1
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Main.fibonacci
0;JMP
// ret label
(Sys.init$ret.0)
// label WHILE
(Sys.init$WHILE)
// goto WHILE              // loops infinitely
@Sys.init$WHILE
0;JMP
// function Main.fibonacci 0
(Main.fibonacci)
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
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt                     // checks if n<2
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Main.0.__LT
D;JLT
@SP
A=M-1
M=0
@Main.0.__LT_EXIT
0;JMP
(Main.0.__LT)
@SP
A=M-1
M=-1
(Main.0.__LT_EXIT)
// if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@Main.fibonacci$IF_TRUE
D;JNE
// goto IF_FALSE
@Main.fibonacci$IF_FALSE
0;JMP
// label IF_TRUE          // if n<2, return n
(Main.fibonacci$IF_TRUE)
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
// label IF_FALSE         // if n>=2, returns fib(n-2)+fib(n-1)
(Main.fibonacci$IF_FALSE)
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
// push constant 2
@2
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
// call Main.fibonacci 1  // computes fib(n-2)
// push retAddr
@Main.fibonacci$ret.0
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
@1
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Main.fibonacci
0;JMP
// ret label
(Main.fibonacci$ret.0)
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
// push constant 1
@1
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
// call Main.fibonacci 1  // computes fib(n-1)
// push retAddr
@Main.fibonacci$ret.1
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
@1
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Main.fibonacci
0;JMP
// ret label
(Main.fibonacci$ret.1)
// add                    // returns fib(n-1) + fib(n-2)
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
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
