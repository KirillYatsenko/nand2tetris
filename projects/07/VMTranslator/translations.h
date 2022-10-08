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
			"A=M-1\n"					\
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
			"A=M-1\n"					\
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

#define END		"(__END)\n"				\
			"@__END\n"				\
			"0; JMP\n"

#endif /* TRANSLATIONS_H */
