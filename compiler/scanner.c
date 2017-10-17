#include "utils.c"

/*******************************************************************/
/* Dependencias externas de LEX */
extern int yylex();
extern int yylineno;
extern char* yytext;

/********************************************************************/
/* Función que analiza las instrucciones y genera el código máquina */
int main(void)
{
	int ntoken, index = 0, line = 1, target = 0;
	ntoken = yylex();
	int* data = (int*) malloc(sizeof(int) * R_LENGTH);

	/*** -Matriz para almacenar etiqueta junto a su direccion en memoria- ***/
	int n_arr = 10, n_char = 22; /* 10 arreglos de strings con 15 caracteres c/u */
	char* word = (char*) malloc(sizeof(char) * n_char);
	char*** mem_adrrs = calloc(n_arr, sizeof(char**) );
	for(int i = 0; i < n_arr; i++) {
    	mem_adrrs[i] = calloc(n_arr, sizeof(char*) );
    	for(int j = 0; j < n_arr; j++) {
        	mem_adrrs[i][j] = calloc(n_char, sizeof(char) );
    	}
	}

	/* Estructura que almacena las direcciones del algoritmo FB */
	mem_adrrs = assignAddresses(mem_adrrs);

	while(ntoken) {
		printf("Token %d\n", ntoken);
		if ( ntoken == TARGET ) {
			if (data[0] == BEQ || data[0] == BNE
						|| data[0] == J )  {
	      word = yytext;
				printf("word %s\n", word);
			}

    }

		/* Se verifica si el token es un indicador */
		else if (ntoken == INDICATOR) {
			/* Formato R */
			if (ADD <= data[0] && data[0] <= DIV) {
				analizeInstructionR(data);
			}
			/* Formato I */
			else if (BEQ <= data[0] && data[0] <= ADDI) {
				if (data[0] == BEQ || data[0] == BNE) {
					data[3] = findAddress(word, mem_adrrs);
					printf("addr %d\n", data[3]);
					analizeInstructionI(data);
				} else analizeInstructionI(data);
			}
			/* Formato J */
			else if (data[0] == J) {
        int addr = findAddress(word, mem_adrrs);
				printf("addr %d\n", addr);
				analizeInstructionJ(data, addr);
			}
			/* STALL */
			else if (data[0] == NOP) {
				noOperation();
			}
			else if (data[0] != TARGET) {
				printf("This instruction doesn't exit, in line %d\n",line);
			  break;
			}
			/* Vacia el arreglo con los datos(tokens) de la instruccion */
			memset(data, '\0', (R_LENGTH * sizeof(int)));
			index = 0;
			line++;
		}
		/* Si se está analizando una etiqueta, calcula la dirección
		 			de	memoria*/
		else if (ntoken == TP) {
      memset(data, '\0', (R_LENGTH * sizeof(int)));
			index = 0;
			line++;
		}

		else {
			if (ntoken == IMMEDIATE) { data[index] = atoi(yytext); }
			else if (ntoken != TARGET) { data[index] = ntoken; }
			index++;
		}
		ntoken = yylex();
	}

	free(data);
	free(mem_adrrs);
	return 0;
}
