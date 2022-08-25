#ifndef TRANSLATIONS_H
#define TRANSLATIONS_H

#define ADD		SP_DEC	/* SP-- */			\
			"A=M\n"					\
			"D=M\n"					\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=M+D\n"

#define SUB		SP_DEC	/* SP-- */			\
			"A=M\n"					\
			"D=M\n"					\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=M-D\n"

#define NEG		"@SP\n"					\
			"A=M-1\n"				\
			"M=-M\n"

#define EQ		JMP("EQ")
#define GT		JMP("GT")
#define LT		JMP("LT")

#define JMP(cond)	SP_DEC	/* SP-- */			\
			"A=M\n"					\
			"D=M\n"					\
			"@SP\n"					\
			"A=M-1\n"				\
			"D=M-D\n"				\
			"@%s.%d.__" cond "\n"			\
			"D;J" cond "\n"				\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=0\n"					\
			"@%s.%d.__" cond "_EXIT\n"		\
			"0;JMP\n"				\
			"(%s.%d.__" cond ")\n"			\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=-1\n"				\
			"(%s.%d.__" cond "_EXIT)\n"

#define AND		SP_DEC	/* SP-- */			\
			"A=M\n"					\
			"D=M\n"					\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=M&D\n"

#define OR		SP_DEC	/* SP-- */			\
			"A=M\n"					\
			"D=M\n"					\
			"@SP\n"					\
			"A=M-1\n"				\
			"M=M|D\n"

#define NOT		"@SP\n"					\
			"A=M-1\n"				\
			"M=!M\n"

#define PUSH_CONST	"@%d\n"					\
			"D=A\n"					\
			PUSH_D

#define PUSH_BASE	"@%s\n"	/* segment */			\
			"D=M\n"					\
			"@%d\n"	/* indx */			\
			"A=D+A\n"				\
			"D=M\n"	/* D = segment[indx] */		\
			PUSH_D

#define PUSH_STATIC	"@%s.%d\n" /* file.indx */		\
			"D=M\n"					\
			PUSH_D

#define TEMP_BASE_ADDR	"5\n"

#define PUSH_TEMP	"@" TEMP_BASE_ADDR			\
			"D=A\n"					\
			"@%d\n"	/* indx */			\
			"A=D+A\n"				\
			"D=M\n"	/* D = *(TEMP + indx) */	\
			PUSH_D

#define PUSH_POINTER	"@%s\n"	/* THIS/THAT */			\
			"D=M\n"					\
			PUSH_D

#define PUSH_D		"@SP\n"	/* *SP = D */			\
			"A=M\n"					\
			"M=D\n"					\
			SP_INC	/* SP++ */

#define SP_INC		"@SP\n"	/* SP++ */			\
			"M=M+1\n"

#define POP_BASE	"@%s\n"	/* segment */			\
			"D=M\n"					\
			"@%d\n"	/* indx */			\
			"D=D+A\n"				\
			POP_D

#define POP_STATIC	"@%s.%d\n" /* file.indx */		\
			"D=A\n"					\
			POP_D

#define POP_TEMP	"@" TEMP_BASE_ADDR			\
			"D=A\n"					\
			"@%d\n"	  /* indx */			\
			"D=D+A\n" /* D = TEMP + indx */		\
			POP_D

#define POP_POINTER	"@%s\n"	/* THIS/THAT */			\
			"D=A\n"					\
			POP_D

#define POP_D		"@R13\n" /* R13 = D */			\
                        "M=D\n"					\
                        SP_DEC	 /* SP-- */			\
                        "A=M\n"					\
                        "D=M\n"					\
                        "@R13\n" /* *R13 = *SP */		\
                        "A=M\n"					\
                        "M=D\n"

#define SP_DEC		"@SP\n"	/* SP-- */			\
			"M=M-1\n"

#define LABEL		"(%s$%s)\n" /* (file.func$label) */

#define GOTO		"@%s$%s\n"				\
			"0;JMP\n"

#define IF		SP_DEC					\
			"A=M\n"					\
			"D=M\n"					\
			"@%s$%s\n"				\
			"D;JNE\n"

#define BOOT		"// bootstrap\n"			\
			"@256\n"				\
			"D=A\n"					\
			"@SP\n"					\
			"M=D\n"					\
			CALL

#define FUNC		"(%s)\n" /* func */

#define PUSH_ZERO	"// push zero #%d\n"			\
			"@0\n"					\
			"D=A\n"					\
			PUSH_D

#define CALL		"// push retAddr\n"			\
			"@%s$ret.%d\n" /* func$ret.x */		\
			"D=A\n"					\
			PUSH_D					\
			PUSH_SEG("LCL")				\
			PUSH_SEG("ARG")				\
			PUSH_SEG("THIS")			\
			PUSH_SEG("THAT")			\
			"// ARG = SP - 5 - nargs\n"		\
			"@SP\n"					\
			"D=M\n"					\
			"@5\n"					\
			"D=D-A\n"				\
			"@%d\n"	/* nargs */			\
			"D=D-A\n"				\
			"@ARG\n"				\
			"M=D\n"					\
			"// LCL = SP\n"				\
			"@SP\n"					\
			"D=M\n"					\
			"@LCL\n"				\
			"M=D\n"					\
			"// goto func\n"			\
			"@%s\n"					\
			"0;JMP\n"				\
			"// ret label\n"			\
			"(%s$ret.%d)\n"

#define PUSH_SEG(seg)	"// push " seg "\n"			\
			"@" seg "\n"				\
			"D=M\n"					\
			PUSH_D

#define RETURN		"// frame(R13) = LCL\n"			\
			"@LCL\n"				\
			"D=M\n"					\
			"@R13\n"				\
			"M=D\n"					\
			"// retAddr(R14) = *(frame - 5)\n"	\
			"@5\n"					\
			"A=D-A\n"				\
			"D=M\n"					\
			"@R14\n"				\
			"M=D\n"					\
			"// *ARG = pop()\n"			\
			"@SP\n"					\
			"AM=M-1\n"				\
			"D=M\n"					\
			"@ARG\n"				\
			"A=M\n"					\
			"M=D\n"					\
			"// SP = ARG + 1\n"			\
			"@ARG\n"				\
			"D=M\n"					\
			"@SP\n"					\
			"M=D+1\n"				\
			RES_SEG("THAT")				\
			RES_SEG("THIS")				\
			RES_SEG("ARG")				\
			RES_SEG("LCL")				\
			"// goto retAddr\n"			\
			"@R14\n"				\
			"A=M\n"					\
			"0;JMP\n"

#define RES_SEG(seg)	"// " seg " = *(--frame)\n"		\
			"@R13\n"				\
			"AM=M-1\n"				\
			"D=M\n"					\
			"@" seg "\n"				\
			"M=D\n"

#define END		"// end\n"				\
			"(__END)\n"				\
			"@__END\n"				\
			"0; JMP\n"

#endif /* TRANSLATIONS_H */
