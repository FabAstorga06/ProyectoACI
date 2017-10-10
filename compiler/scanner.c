#include "utils.c"

/*******************************************************************/
/* Dependencias externas de LEX */
extern int yylex();
extern int yylineno;
extern char* yytext;

/********************************************************************/
/* Función analiza las instrucciones y genera el código máquina */
int main(void)
{
	int ntoken, index = 0;
	ntoken = yylex();
	int* data = (int*) malloc(sizeof(int) * R_LENGTH);

	while(ntoken) {
		printf("Token %d\n", ntoken);

		/* Se verifica si el token es un indicador */
		if (ntoken == INDICATOR) {
			/* Formato R */
			if (ADD <= data[0] && data[0] <= DIV) {
				analizeInstructionR(data);
			}
			/* Formato I */
			else if (BEQ <= data[0] && data[0] <= SW) {
				analizeInstructionI(data);
			}
			/* Formato J */
			else if (data[0] == J) {
				analizeInstructionJ(data);
			}
			/* STALL */
			else if (data[0] == NOP) {
				noOperation();
			}
			else {
				printf("This instruction doesn't exit, in line %d\n",yylineno);
				break;
			}
			/* Vacia el arreglo con los datos(tokens) de la instruccion */
			memset(data, '\0', (R_LENGTH * sizeof(int)));
			index = 0;
		}

		else {
			if (ntoken == IMMEDIATE) { data[index] = atoi(yytext); }
			else { data[index] = ntoken; }
			index++;
		}
		ntoken = yylex();
	}

	free(data);
	return 0;
}
