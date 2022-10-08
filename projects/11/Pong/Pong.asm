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
// function Bat.new 0
(Bat.new)
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
// push retAddr
@Bat.new$ret.0
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
@Memory.alloc
0;JMP
// ret label
(Bat.new$ret.0)
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 3
@ARG
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.show 1
// push retAddr
@Bat.new$ret.1
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
@Bat.show
0;JMP
// ret label
(Bat.new$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
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
// function Bat.dispose 0
(Bat.dispose)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
// push retAddr
@Bat.dispose$ret.0
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
@Memory.deAlloc
0;JMP
// ret label
(Bat.dispose$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.show 0
(Bat.show)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Screen.setColor 1
// push retAddr
@Bat.show$ret.0
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
@Screen.setColor
0;JMP
// ret label
(Bat.show$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.draw 1
// push retAddr
@Bat.show$ret.1
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
@Bat.draw
0;JMP
// ret label
(Bat.show$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.hide 0
(Bat.hide)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
// push retAddr
@Bat.hide$ret.0
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
@Screen.setColor
0;JMP
// ret label
(Bat.hide$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.draw 1
// push retAddr
@Bat.hide$ret.1
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
@Bat.draw
0;JMP
// ret label
(Bat.hide$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.draw 0
(Bat.draw)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@THIS
D=M
@3
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
// call Screen.drawRectangle 4
// push retAddr
@Bat.draw$ret.0
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Bat.draw$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.setDirection 0
(Bat.setDirection)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.getLeft 0
(Bat.getLeft)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
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
// function Bat.getRight 0
(Bat.getRight)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// function Bat.setWidth 0
(Bat.setWidth)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.hide 1
// push retAddr
@Bat.setWidth$ret.0
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
@Bat.hide
0;JMP
// ret label
(Bat.setWidth$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.show 1
// push retAddr
@Bat.setWidth$ret.1
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
@Bat.show
0;JMP
// ret label
(Bat.setWidth$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Bat.move 0
(Bat.move)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 4
@THIS
D=M
@4
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
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Bat.0.__EQ
D;JEQ
@SP
A=M-1
M=0
@Bat.0.__EQ_EXIT
0;JMP
(Bat.0.__EQ)
@SP
A=M-1
M=-1
(Bat.0.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.26
@SP
M=M-1
A=M
D=M
@Bat.move$ELSE.26
D;JNE
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
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
@Bat.0.__LT
D;JLT
@SP
A=M-1
M=0
@Bat.0.__LT_EXIT
0;JMP
(Bat.0.__LT)
@SP
A=M-1
M=-1
(Bat.0.__LT_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.27
@SP
M=M-1
A=M
D=M
@Bat.move$ELSE.27
D;JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.27
@Bat.move$IF_EXIT.27
0;JMP
// label ELSE.27
(Bat.move$ELSE.27)
// label IF_EXIT.27
(Bat.move$IF_EXIT.27)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
// push retAddr
@Bat.move$ret.0
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
@Screen.setColor
0;JMP
// ret label
(Bat.move$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push constant 1
@1
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push constant 4
@4
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@THIS
D=M
@3
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
// call Screen.drawRectangle 4
// push retAddr
@Bat.move$ret.1
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Bat.move$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Screen.setColor 1
// push retAddr
@Bat.move$ret.2
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
@Screen.setColor
0;JMP
// ret label
(Bat.move$ret.2)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@THIS
D=M
@3
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
// call Screen.drawRectangle 4
// push retAddr
@Bat.move$ret.3
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Bat.move$ret.3)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.26
@Bat.move$IF_EXIT.26
0;JMP
// label ELSE.26
(Bat.move$ELSE.26)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push constant 511
@511
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
@Bat.0.__GT
D;JGT
@SP
A=M-1
M=0
@Bat.0.__GT_EXIT
0;JMP
(Bat.0.__GT)
@SP
A=M-1
M=-1
(Bat.0.__GT_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.28
@SP
M=M-1
A=M
D=M
@Bat.move$ELSE.28
D;JNE
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.28
@Bat.move$IF_EXIT.28
0;JMP
// label ELSE.28
(Bat.move$ELSE.28)
// label IF_EXIT.28
(Bat.move$IF_EXIT.28)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
// push retAddr
@Bat.move$ret.4
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
@Screen.setColor
0;JMP
// ret label
(Bat.move$ret.4)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@THIS
D=M
@3
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
// call Screen.drawRectangle 4
// push retAddr
@Bat.move$ret.5
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Bat.move$ret.5)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Screen.setColor 1
// push retAddr
@Bat.move$ret.6
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
@Screen.setColor
0;JMP
// ret label
(Bat.move$ret.6)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push constant 3
@3
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@THIS
D=M
@3
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
// call Screen.drawRectangle 4
// push retAddr
@Bat.move$ret.7
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Bat.move$ret.7)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.26
(Bat.move$IF_EXIT.26)
// push constant 0
@0
D=A
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
// function Ball.new 0
(Ball.new)
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
// push retAddr
@Ball.new$ret.0
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
@Memory.alloc
0;JMP
// ret label
(Ball.new$ret.0)
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 10
@THIS
D=M
@10
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 3
@ARG
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
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
// pop this 11
@THIS
D=M
@11
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 4
@ARG
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 12
@THIS
D=M
@12
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 5
@ARG
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
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
// pop this 13
@THIS
D=M
@13
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.show 1
// push retAddr
@Ball.new$ret.1
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
@Ball.show
0;JMP
// ret label
(Ball.new$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
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
// function Ball.dispose 0
(Ball.dispose)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
// push retAddr
@Ball.dispose$ret.0
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
@Memory.deAlloc
0;JMP
// ret label
(Ball.dispose$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Ball.show 0
(Ball.show)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Screen.setColor 1
// push retAddr
@Ball.show$ret.0
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
@Screen.setColor
0;JMP
// ret label
(Ball.show$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.draw 1
// push retAddr
@Ball.show$ret.1
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
@Ball.draw
0;JMP
// ret label
(Ball.show$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Ball.hide 0
(Ball.hide)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
// push retAddr
@Ball.hide$ret.0
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
@Screen.setColor
0;JMP
// ret label
(Ball.hide$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.draw 1
// push retAddr
@Ball.hide$ret.1
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
@Ball.draw
0;JMP
// ret label
(Ball.hide$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Ball.draw 0
(Ball.draw)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
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
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
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
// call Screen.drawRectangle 4
// push retAddr
@Ball.draw$ret.0
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(Ball.draw$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Ball.getLeft 0
(Ball.getLeft)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
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
// function Ball.getRight 0
(Ball.getRight)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
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
// function Ball.setDestination 3
(Ball.setDestination)
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
// push zero #2
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// push this 0
@THIS
D=M
@0
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
// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
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
// pop this 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
// push retAddr
@Ball.setDestination$ret.0
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
@Math.abs
0;JMP
// ret label
(Ball.setDestination$ret.0)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
// push retAddr
@Ball.setDestination$ret.1
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
@Math.abs
0;JMP
// ret label
(Ball.setDestination$ret.1)
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.1.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.1.__LT_EXIT
0;JMP
(Ball.1.__LT)
@SP
A=M-1
M=-1
(Ball.1.__LT_EXIT)
// pop this 7
@THIS
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.9
@SP
M=M-1
A=M
D=M
@Ball.setDestination$ELSE.9
D;JNE
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
// pop local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@ARG
D=M
@2
A=D+A
D=M
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
@Ball.2.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.2.__LT_EXIT
0;JMP
(Ball.2.__LT)
@SP
A=M-1
M=-1
(Ball.2.__LT_EXIT)
// pop this 8
@THIS
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.3.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.3.__LT_EXIT
0;JMP
(Ball.3.__LT)
@SP
A=M-1
M=-1
(Ball.3.__LT_EXIT)
// pop this 9
@THIS
D=M
@9
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.9
@Ball.setDestination$IF_EXIT.9
0;JMP
// label ELSE.9
(Ball.setDestination$ELSE.9)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.4.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.4.__LT_EXIT
0;JMP
(Ball.4.__LT)
@SP
A=M-1
M=-1
(Ball.4.__LT_EXIT)
// pop this 8
@THIS
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@ARG
D=M
@2
A=D+A
D=M
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
@Ball.5.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.5.__LT_EXIT
0;JMP
(Ball.5.__LT)
@SP
A=M-1
M=-1
(Ball.5.__LT_EXIT)
// pop this 9
@THIS
D=M
@9
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.9
(Ball.setDestination$IF_EXIT.9)
// push constant 2
@2
D=A
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
// call Math.multiply 2
// push retAddr
@Ball.setDestination$ret.2
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.setDestination$ret.2)
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
// sub
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M-D
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
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
// call Math.multiply 2
// push retAddr
@Ball.setDestination$ret.3
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.setDestination$ret.3)
// pop this 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
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
// sub
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M-D
// call Math.multiply 2
// push retAddr
@Ball.setDestination$ret.4
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.setDestination$ret.4)
// pop this 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Ball.move 0
(Ball.move)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.hide 1
// push retAddr
@Ball.move$ret.0
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
@Ball.hide
0;JMP
// ret label
(Ball.move$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
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
@Ball.6.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.6.__LT_EXIT
0;JMP
(Ball.6.__LT)
@SP
A=M-1
M=-1
(Ball.6.__LT_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.10
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.10
D;JNE
// push this 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 5
@THIS
D=M
@5
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
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.10
@Ball.move$IF_EXIT.10
0;JMP
// label ELSE.10
(Ball.move$ELSE.10)
// push this 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@THIS
D=M
@6
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
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 9
@THIS
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.11
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.11
D;JNE
// push this 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.12
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.12
D;JNE
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.12
@Ball.move$IF_EXIT.12
0;JMP
// label ELSE.12
(Ball.move$ELSE.12)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.12
(Ball.move$IF_EXIT.12)
// goto IF_EXIT.11
@Ball.move$IF_EXIT.11
0;JMP
// label ELSE.11
(Ball.move$ELSE.11)
// push this 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.13
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.13
D;JNE
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.13
@Ball.move$IF_EXIT.13
0;JMP
// label ELSE.13
(Ball.move$ELSE.13)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.13
(Ball.move$IF_EXIT.13)
// label IF_EXIT.11
(Ball.move$IF_EXIT.11)
// label IF_EXIT.10
(Ball.move$IF_EXIT.10)
// push this 8
@THIS
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.14
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.14
D;JNE
// push this 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.15
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.15
D;JNE
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.15
@Ball.move$IF_EXIT.15
0;JMP
// label ELSE.15
(Ball.move$ELSE.15)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.15
(Ball.move$IF_EXIT.15)
// goto IF_EXIT.14
@Ball.move$IF_EXIT.14
0;JMP
// label ELSE.14
(Ball.move$ELSE.14)
// push this 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.16
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.16
D;JNE
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.16
@Ball.move$IF_EXIT.16
0;JMP
// label ELSE.16
(Ball.move$ELSE.16)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.16
(Ball.move$IF_EXIT.16)
// label IF_EXIT.14
(Ball.move$IF_EXIT.14)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 10
@THIS
D=M
@10
A=D+A
D=M
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
@Ball.1.__GT
D;JGT
@SP
A=M-1
M=0
@Ball.1.__GT_EXIT
0;JMP
(Ball.1.__GT)
@SP
A=M-1
M=-1
(Ball.1.__GT_EXIT)
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto ELSE.17
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.17
D;JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 10
@THIS
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.17
@Ball.move$IF_EXIT.17
0;JMP
// label ELSE.17
(Ball.move$ELSE.17)
// label IF_EXIT.17
(Ball.move$IF_EXIT.17)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 11
@THIS
D=M
@11
A=D+A
D=M
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
@Ball.7.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.7.__LT_EXIT
0;JMP
(Ball.7.__LT)
@SP
A=M-1
M=-1
(Ball.7.__LT_EXIT)
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto ELSE.18
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.18
D;JNE
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 11
@THIS
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.18
@Ball.move$IF_EXIT.18
0;JMP
// label ELSE.18
(Ball.move$ELSE.18)
// label IF_EXIT.18
(Ball.move$IF_EXIT.18)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 12
@THIS
D=M
@12
A=D+A
D=M
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
@Ball.2.__GT
D;JGT
@SP
A=M-1
M=0
@Ball.2.__GT_EXIT
0;JMP
(Ball.2.__GT)
@SP
A=M-1
M=-1
(Ball.2.__GT_EXIT)
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto ELSE.19
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.19
D;JNE
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 12
@THIS
D=M
@12
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.19
@Ball.move$IF_EXIT.19
0;JMP
// label ELSE.19
(Ball.move$ELSE.19)
// label IF_EXIT.19
(Ball.move$IF_EXIT.19)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 13
@THIS
D=M
@13
A=D+A
D=M
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
@Ball.8.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.8.__LT_EXIT
0;JMP
(Ball.8.__LT)
@SP
A=M-1
M=-1
(Ball.8.__LT_EXIT)
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto ELSE.20
@SP
M=M-1
A=M
D=M
@Ball.move$ELSE.20
D;JNE
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 13
@THIS
D=M
@13
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.20
@Ball.move$IF_EXIT.20
0;JMP
// label ELSE.20
(Ball.move$ELSE.20)
// label IF_EXIT.20
(Ball.move$IF_EXIT.20)
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.show 1
// push retAddr
@Ball.move$ret.1
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
@Ball.show
0;JMP
// ret label
(Ball.move$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 14
@THIS
D=M
@14
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
// function Ball.bounce 5
(Ball.bounce)
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
// push zero #2
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push zero #3
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push zero #4
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
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
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.0
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.0)
// pop local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 3
@THIS
D=M
@3
A=D+A
D=M
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
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.1
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.1)
// pop local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// push constant 0
@0
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
@Ball.1.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.1.__EQ_EXIT
0;JMP
(Ball.1.__EQ)
@SP
A=M-1
M=-1
(Ball.1.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.21
@SP
M=M-1
A=M
D=M
@Ball.bounce$ELSE.21
D;JNE
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.21
@Ball.bounce$IF_EXIT.21
0;JMP
// label ELSE.21
(Ball.bounce$ELSE.21)
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
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
@Ball.9.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.9.__LT_EXIT
0;JMP
(Ball.9.__LT)
@SP
A=M-1
M=-1
(Ball.9.__LT_EXIT)
// not
@SP
A=M-1
M=!M
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
// push constant 1
@1
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
@Ball.2.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.2.__EQ_EXIT
0;JMP
(Ball.2.__EQ)
@SP
A=M-1
M=-1
(Ball.2.__EQ_EXIT)
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
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
@Ball.10.__LT
D;JLT
@SP
A=M-1
M=0
@Ball.10.__LT_EXIT
0;JMP
(Ball.10.__LT)
@SP
A=M-1
M=-1
(Ball.10.__LT_EXIT)
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
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.3.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.3.__EQ_EXIT
0;JMP
(Ball.3.__EQ)
@SP
A=M-1
M=-1
(Ball.3.__EQ_EXIT)
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
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
// if-goto ELSE.22
@SP
M=M-1
A=M
D=M
@Ball.bounce$ELSE.22
D;JNE
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.22
@Ball.bounce$IF_EXIT.22
0;JMP
// label ELSE.22
(Ball.bounce$ELSE.22)
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.22
(Ball.bounce$IF_EXIT.22)
// label IF_EXIT.21
(Ball.bounce$IF_EXIT.21)
// push this 14
@THIS
D=M
@14
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
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.4.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.4.__EQ_EXIT
0;JMP
(Ball.4.__EQ)
@SP
A=M-1
M=-1
(Ball.4.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.23
@SP
M=M-1
A=M
D=M
@Ball.bounce$ELSE.23
D;JNE
// push constant 506
@506
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.2
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.2)
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.3
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.3)
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
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
// push local 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.4
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.4)
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.23
@Ball.bounce$IF_EXIT.23
0;JMP
// label ELSE.23
(Ball.bounce$ELSE.23)
// push this 14
@THIS
D=M
@14
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
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@Ball.5.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.5.__EQ_EXIT
0;JMP
(Ball.5.__EQ)
@SP
A=M-1
M=-1
(Ball.5.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.24
@SP
M=M-1
A=M
D=M
@Ball.bounce$ELSE.24
D;JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.5
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.5)
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.6
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.6)
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
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
// push local 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.7
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.7)
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.24
@Ball.bounce$IF_EXIT.24
0;JMP
// label ELSE.24
(Ball.bounce$ELSE.24)
// push this 14
@THIS
D=M
@14
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
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
@Ball.6.__EQ
D;JEQ
@SP
A=M-1
M=0
@Ball.6.__EQ_EXIT
0;JMP
(Ball.6.__EQ)
@SP
A=M-1
M=-1
(Ball.6.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.25
@SP
M=M-1
A=M
D=M
@Ball.bounce$ELSE.25
D;JNE
// push constant 250
@250
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.8
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.8)
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.9
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.9)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
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
// push local 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.10
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.10)
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.25
@Ball.bounce$IF_EXIT.25
0;JMP
// label ELSE.25
(Ball.bounce$ELSE.25)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.11
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.11)
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
// push retAddr
@Ball.bounce$ret.12
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.divide
0;JMP
// ret label
(Ball.bounce$ret.12)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
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
// push local 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
// push retAddr
@Ball.bounce$ret.13
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Math.multiply
0;JMP
// ret label
(Ball.bounce$ret.13)
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_EXIT.25
(Ball.bounce$IF_EXIT.25)
// label IF_EXIT.24
(Ball.bounce$IF_EXIT.24)
// label IF_EXIT.23
(Ball.bounce$IF_EXIT.23)
// push pointer 0
@THIS
D=M
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
// call Ball.setDestination 3
// push retAddr
@Ball.bounce$ret.14
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
@3
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Ball.setDestination
0;JMP
// ret label
(Ball.bounce$ret.14)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function Main.main 1
(Main.main)
// push zero #0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.newInstance 0
// push retAddr
@Main.main$ret.0
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
@PongGame.newInstance
0;JMP
// ret label
(Main.main$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// call PongGame.getInstance 0
// push retAddr
@Main.main$ret.1
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
@PongGame.getInstance
0;JMP
// ret label
(Main.main$ret.1)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// call PongGame.run 1
// push retAddr
@Main.main$ret.2
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
@PongGame.run
0;JMP
// ret label
(Main.main$ret.2)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
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
// call PongGame.dispose 1
// push retAddr
@Main.main$ret.3
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
@PongGame.dispose
0;JMP
// ret label
(Main.main$ret.3)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function PongGame.new 0
(PongGame.new)
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
// push retAddr
@PongGame.new$ret.0
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
@Memory.alloc
0;JMP
// ret label
(PongGame.new$ret.0)
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// call Screen.clearScreen 0
// push retAddr
@PongGame.new$ret.1
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
@Screen.clearScreen
0;JMP
// ret label
(PongGame.new$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 230
@230
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Bat.new 4
// push retAddr
@PongGame.new$ret.2
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Bat.new
0;JMP
// ret label
(PongGame.new$ret.2)
// pop this 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 253
@253
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 222
@222
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Ball.new 6
// push retAddr
@PongGame.new$ret.3
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
@6
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Ball.new
0;JMP
// ret label
(PongGame.new$ret.3)
// pop this 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 400
@400
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Ball.setDestination 3
// push retAddr
@PongGame.new$ret.4
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
@3
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Ball.setDestination
0;JMP
// ret label
(PongGame.new$ret.4)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 238
@238
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 240
@240
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
// push retAddr
@PongGame.new$ret.5
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
@4
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Screen.drawRectangle
0;JMP
// ret label
(PongGame.new$ret.5)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
// push retAddr
@PongGame.new$ret.6
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Output.moveCursor
0;JMP
// ret label
(PongGame.new$ret.6)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
// push retAddr
@PongGame.new$ret.7
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
@String.new
0;JMP
// ret label
(PongGame.new$ret.7)
// push constant 83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.8
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.8)
// push constant 99
@99
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.9
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.9)
// push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.10
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.10)
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.11
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.11)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.12
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.12)
// push constant 58
@58
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.13
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.13)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.14
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.14)
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.new$ret.15
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.new$ret.15)
// call Output.printString 1
// push retAddr
@PongGame.new$ret.16
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
@Output.printString
0;JMP
// ret label
(PongGame.new$ret.16)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
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
// function PongGame.dispose 0
(PongGame.dispose)
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.dispose 1
// push retAddr
@PongGame.dispose$ret.0
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
@Bat.dispose
0;JMP
// ret label
(PongGame.dispose$ret.0)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.dispose 1
// push retAddr
@PongGame.dispose$ret.1
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
@Ball.dispose
0;JMP
// ret label
(PongGame.dispose$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
// push retAddr
@PongGame.dispose$ret.2
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
@Memory.deAlloc
0;JMP
// ret label
(PongGame.dispose$ret.2)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function PongGame.newInstance 0
(PongGame.newInstance)
// call PongGame.new 0
// push retAddr
@PongGame.newInstance$ret.0
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
@PongGame.new
0;JMP
// ret label
(PongGame.newInstance$ret.0)
// pop static 0
@PongGame.0
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
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
// function PongGame.getInstance 0
(PongGame.getInstance)
// push static 0
@PongGame.0
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
// function PongGame.run 1
(PongGame.run)
// push zero #0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE.0
(PongGame.run$WHILE.0)
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto WHILE_EXIT.0
@SP
M=M-1
A=M
D=M
@PongGame.run$WHILE_EXIT.0
D;JNE
// label WHILE.1
(PongGame.run$WHILE.1)
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
// push constant 0
@0
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
@PongGame.7.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.7.__EQ_EXIT
0;JMP
(PongGame.7.__EQ)
@SP
A=M-1
M=-1
(PongGame.7.__EQ_EXIT)
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
// not
@SP
A=M-1
M=!M
// if-goto WHILE_EXIT.1
@SP
M=M-1
A=M
D=M
@PongGame.run$WHILE_EXIT.1
D;JNE
// call Keyboard.keyPressed 0
// push retAddr
@PongGame.run$ret.0
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
@Keyboard.keyPressed
0;JMP
// ret label
(PongGame.run$ret.0)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.move 1
// push retAddr
@PongGame.run$ret.1
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
@Bat.move
0;JMP
// ret label
(PongGame.run$ret.1)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.moveBall 1
// push retAddr
@PongGame.run$ret.2
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
@PongGame.moveBall
0;JMP
// ret label
(PongGame.run$ret.2)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.wait 1
// push retAddr
@PongGame.run$ret.3
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
@Sys.wait
0;JMP
// ret label
(PongGame.run$ret.3)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE.1
@PongGame.run$WHILE.1
0;JMP
// label WHILE_EXIT.1
(PongGame.run$WHILE_EXIT.1)
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
// push constant 130
@130
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
@PongGame.8.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.8.__EQ_EXIT
0;JMP
(PongGame.8.__EQ)
@SP
A=M-1
M=-1
(PongGame.8.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.0
@SP
M=M-1
A=M
D=M
@PongGame.run$ELSE.0
D;JNE
// push this 0
@THIS
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
// call Bat.setDirection 2
// push retAddr
@PongGame.run$ret.4
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Bat.setDirection
0;JMP
// ret label
(PongGame.run$ret.4)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.0
@PongGame.run$IF_EXIT.0
0;JMP
// label ELSE.0
(PongGame.run$ELSE.0)
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
// push constant 132
@132
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
@PongGame.9.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.9.__EQ_EXIT
0;JMP
(PongGame.9.__EQ)
@SP
A=M-1
M=-1
(PongGame.9.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.1
@SP
M=M-1
A=M
D=M
@PongGame.run$ELSE.1
D;JNE
// push this 0
@THIS
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
// call Bat.setDirection 2
// push retAddr
@PongGame.run$ret.5
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Bat.setDirection
0;JMP
// ret label
(PongGame.run$ret.5)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.1
@PongGame.run$IF_EXIT.1
0;JMP
// label ELSE.1
(PongGame.run$ELSE.1)
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
// push constant 140
@140
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
@PongGame.10.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.10.__EQ_EXIT
0;JMP
(PongGame.10.__EQ)
@SP
A=M-1
M=-1
(PongGame.10.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.2
@SP
M=M-1
A=M
D=M
@PongGame.run$ELSE.2
D;JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// pop this 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.2
@PongGame.run$IF_EXIT.2
0;JMP
// label ELSE.2
(PongGame.run$ELSE.2)
// label IF_EXIT.2
(PongGame.run$IF_EXIT.2)
// label IF_EXIT.1
(PongGame.run$IF_EXIT.1)
// label IF_EXIT.0
(PongGame.run$IF_EXIT.0)
// label WHILE.2
(PongGame.run$WHILE.2)
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
// push constant 0
@0
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
@PongGame.11.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.11.__EQ_EXIT
0;JMP
(PongGame.11.__EQ)
@SP
A=M-1
M=-1
(PongGame.11.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
// not
@SP
A=M-1
M=!M
// if-goto WHILE_EXIT.2
@SP
M=M-1
A=M
D=M
@PongGame.run$WHILE_EXIT.2
D;JNE
// call Keyboard.keyPressed 0
// push retAddr
@PongGame.run$ret.6
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
@Keyboard.keyPressed
0;JMP
// ret label
(PongGame.run$ret.6)
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.move 1
// push retAddr
@PongGame.run$ret.7
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
@Bat.move
0;JMP
// ret label
(PongGame.run$ret.7)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.moveBall 1
// push retAddr
@PongGame.run$ret.8
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
@PongGame.moveBall
0;JMP
// ret label
(PongGame.run$ret.8)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.wait 1
// push retAddr
@PongGame.run$ret.9
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
@Sys.wait
0;JMP
// ret label
(PongGame.run$ret.9)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE.2
@PongGame.run$WHILE.2
0;JMP
// label WHILE_EXIT.2
(PongGame.run$WHILE_EXIT.2)
// goto WHILE.0
@PongGame.run$WHILE.0
0;JMP
// label WHILE_EXIT.0
(PongGame.run$WHILE_EXIT.0)
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// if-goto ELSE.3
@SP
M=M-1
A=M
D=M
@PongGame.run$ELSE.3
D;JNE
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
// push retAddr
@PongGame.run$ret.10
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Output.moveCursor
0;JMP
// ret label
(PongGame.run$ret.10)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
// push retAddr
@PongGame.run$ret.11
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
@String.new
0;JMP
// ret label
(PongGame.run$ret.11)
// push constant 71
@71
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.12
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.12)
// push constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.13
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.13)
// push constant 109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.14
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.14)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.15
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.15)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.16
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.16)
// push constant 79
@79
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.17
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.17)
// push constant 118
@118
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.18
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.18)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.19
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.19)
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
// push retAddr
@PongGame.run$ret.20
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@String.appendChar
0;JMP
// ret label
(PongGame.run$ret.20)
// call Output.printString 1
// push retAddr
@PongGame.run$ret.21
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
@Output.printString
0;JMP
// ret label
(PongGame.run$ret.21)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.3
@PongGame.run$IF_EXIT.3
0;JMP
// label ELSE.3
(PongGame.run$ELSE.3)
// label IF_EXIT.3
(PongGame.run$IF_EXIT.3)
// push constant 0
@0
D=A
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
// function PongGame.moveBall 5
(PongGame.moveBall)
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
// push zero #2
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push zero #3
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push zero #4
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
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
// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.move 1
// push retAddr
@PongGame.moveBall$ret.0
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
@Ball.move
0;JMP
// ret label
(PongGame.moveBall$ret.0)
// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
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
@PongGame.3.__GT
D;JGT
@SP
A=M-1
M=0
@PongGame.3.__GT_EXIT
0;JMP
(PongGame.3.__GT)
@SP
A=M-1
M=-1
(PongGame.3.__GT_EXIT)
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 5
@THIS
D=M
@5
A=D+A
D=M
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
@PongGame.12.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.12.__EQ_EXIT
0;JMP
(PongGame.12.__EQ)
@SP
A=M-1
M=-1
(PongGame.12.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M&D
// not
@SP
A=M-1
M=!M
// if-goto ELSE.4
@SP
M=M-1
A=M
D=M
@PongGame.moveBall$ELSE.4
D;JNE
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.getLeft 1
// push retAddr
@PongGame.moveBall$ret.1
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
@Bat.getLeft
0;JMP
// ret label
(PongGame.moveBall$ret.1)
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.getRight 1
// push retAddr
@PongGame.moveBall$ret.2
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
@Bat.getRight
0;JMP
// ret label
(PongGame.moveBall$ret.2)
// pop local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.getLeft 1
// push retAddr
@PongGame.moveBall$ret.3
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
@Ball.getLeft
0;JMP
// ret label
(PongGame.moveBall$ret.3)
// pop local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.getRight 1
// push retAddr
@PongGame.moveBall$ret.4
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
@Ball.getRight
0;JMP
// ret label
(PongGame.moveBall$ret.4)
// pop local 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
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
@PongGame.13.__EQ
D;JEQ
@SP
A=M-1
M=0
@PongGame.13.__EQ_EXIT
0;JMP
(PongGame.13.__EQ)
@SP
A=M-1
M=-1
(PongGame.13.__EQ_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.5
@SP
M=M-1
A=M
D=M
@PongGame.moveBall$ELSE.5
D;JNE
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
// push local 4
@LCL
D=M
@4
A=D+A
D=M
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
@PongGame.4.__GT
D;JGT
@SP
A=M-1
M=0
@PongGame.4.__GT_EXIT
0;JMP
(PongGame.4.__GT)
@SP
A=M-1
M=-1
(PongGame.4.__GT_EXIT)
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@LCL
D=M
@3
A=D+A
D=M
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
@PongGame.11.__LT
D;JLT
@SP
A=M-1
M=0
@PongGame.11.__LT_EXIT
0;JMP
(PongGame.11.__LT)
@SP
A=M-1
M=-1
(PongGame.11.__LT_EXIT)
// or
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M|D
// pop this 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
A=M-1
M=!M
// not
@SP
A=M-1
M=!M
// if-goto ELSE.6
@SP
M=M-1
A=M
D=M
@PongGame.moveBall$ELSE.6
D;JNE
// push local 4
@LCL
D=M
@4
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
// push constant 10
@10
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
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@PongGame.12.__LT
D;JLT
@SP
A=M-1
M=0
@PongGame.12.__LT_EXIT
0;JMP
(PongGame.12.__LT)
@SP
A=M-1
M=-1
(PongGame.12.__LT_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.7
@SP
M=M-1
A=M
D=M
@PongGame.moveBall$ELSE.7
D;JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
A=M-1
M=-M
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.7
@PongGame.moveBall$IF_EXIT.7
0;JMP
// label ELSE.7
(PongGame.moveBall$ELSE.7)
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@LCL
D=M
@2
A=D+A
D=M
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
// sub
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M-D
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@PongGame.5.__GT
D;JGT
@SP
A=M-1
M=0
@PongGame.5.__GT_EXIT
0;JMP
(PongGame.5.__GT)
@SP
A=M-1
M=-1
(PongGame.5.__GT_EXIT)
// not
@SP
A=M-1
M=!M
// if-goto ELSE.8
@SP
M=M-1
A=M
D=M
@PongGame.moveBall$ELSE.8
D;JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.8
@PongGame.moveBall$IF_EXIT.8
0;JMP
// label ELSE.8
(PongGame.moveBall$ELSE.8)
// label IF_EXIT.8
(PongGame.moveBall$IF_EXIT.8)
// label IF_EXIT.7
(PongGame.moveBall$IF_EXIT.7)
// push this 6
@THIS
D=M
@6
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
// pop this 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.setWidth 2
// push retAddr
@PongGame.moveBall$ret.5
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Bat.setWidth
0;JMP
// ret label
(PongGame.moveBall$ret.5)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 4
@THIS
D=M
@4
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
// add
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=M+D
// pop this 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
// push retAddr
@PongGame.moveBall$ret.6
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Output.moveCursor
0;JMP
// ret label
(PongGame.moveBall$ret.6)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printInt 1
// push retAddr
@PongGame.moveBall$ret.7
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
@Output.printInt
0;JMP
// ret label
(PongGame.moveBall$ret.7)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.6
@PongGame.moveBall$IF_EXIT.6
0;JMP
// label ELSE.6
(PongGame.moveBall$ELSE.6)
// label IF_EXIT.6
(PongGame.moveBall$IF_EXIT.6)
// goto IF_EXIT.5
@PongGame.moveBall$IF_EXIT.5
0;JMP
// label ELSE.5
(PongGame.moveBall$ELSE.5)
// label IF_EXIT.5
(PongGame.moveBall$IF_EXIT.5)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
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
// call Ball.bounce 2
// push retAddr
@PongGame.moveBall$ret.8
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
@2
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto func
@Ball.bounce
0;JMP
// ret label
(PongGame.moveBall$ret.8)
// pop temp 0
@5
D=A
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_EXIT.4
@PongGame.moveBall$IF_EXIT.4
0;JMP
// label ELSE.4
(PongGame.moveBall$ELSE.4)
// label IF_EXIT.4
(PongGame.moveBall$IF_EXIT.4)
// push constant 0
@0
D=A
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
// end
(__END)
@__END
0; JMP
