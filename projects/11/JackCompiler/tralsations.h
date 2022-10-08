#ifndef TRANSLATIONS_H
#define TRANSLATIONS_H

#define T_FUNC	"function %s.%s %d\n"	// className.subroutineName nVars
#define T_PUSH	"push %s %d\n"		// push segment index
#define T_CALL	"call %s %d\n"		// call nargs
#define T_LABEL "label %s.%d\n"		// label indx
#define T_RET	"return\n"
#define T_IF	"if-goto %s.%d\n"	// label indx
#define T_GOTO	"goto %s.%d\n"		// label indx

/* Arithmetic */
#define T_POP	"pop %s %d\n"		// pop segment index
#define T_ADD	"add\n"
#define T_SUB	"sub\n"
#define T_EQL	"eq\n"
#define T_GT	"gt\n"
#define T_LT	"lt\n"
#define T_MULT	"call Math.multiply 2\n"
#define T_DIV	"call Math.divide 2\n"
#define T_AND	"and\n"
#define T_OR	"or\n"
#define T_NEG	"neg\n"
#define T_NOT	"not\n"

#endif /* TRANSLATIONS_H */
