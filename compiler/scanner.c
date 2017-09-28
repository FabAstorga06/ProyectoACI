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
			if (ADD <= data[0] && data[0] <= SUB) {
				analizeInstructionR(data);
			}
			/* Formato I */
			else if (LW <= data[0] && data[0] <= SW) {
				analizeInstructionI(data);
			}
			/* Formato J */
			else if (J <= data[0] && data[0] <= BNE) {
				analizeInstructionJ(data);
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
			data[index] = ntoken;
			index++;
		}
		ntoken = yylex();
	}

	free(data);
	return 0;
}
