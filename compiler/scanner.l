%{
#include "constants.h"
%}

%%

[rR][1]					return REG1;
[rR][2]					return REG2;
[rR][3]					return REG3;
[rR][4]					return REG4;
[rR][5]					return REG5;
[rR][6]					return REG6;
[rR][7]					return REG7;
[rR][8]					return REG8;
[rR][9]					return REG9;
[rR][1][0]			return REG10;
[rR][1][1]			return REG11;
[rR][1][2]			return REG12;
[rR][1][3]			return REG13;
[rR][1][4]			return REG14;
[rR][1][5]			return REG15;
[rR][1][6]			return REG16;

[ \t\n | ,]			;
[\(|\)]					return PARENTESIS;
[1-9][0-9]*			return IMMEDIATE;
\.							return INDICATOR;

"add"						return ADD;
"sub"						return SUB;
"lw"						return LW;
"j"							return J;

%%

int yywrap(void) {
		return 1;
}
