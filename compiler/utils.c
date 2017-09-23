#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include "scanner.h"

/*************************************************************************/
/* Convierte un numero de base decimal a base binaria */

char* convertBinary(unsigned int num, int pivot) {
	unsigned int index = 0;
	unsigned int bit = 1U << (sizeof(unsigned int) + pivot);
	char* bin = (char*) malloc( sizeof(char) * bit);

	while ( bit ){
			bin[index] = (num & bit) ? '1' : '0';
			bit >>= 1;
			index++;
	}
	return bin;
}

/*************************************************************************/
/* Funcion para concatenar dos cadenas de caracteres */

char* concatenate(const char *s1, const char *s2)
{
    char *result = malloc(strlen(s1) + strlen(s2) + 1);
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

/*************************************************************************/
/* Función que agrega cada instrucción procesada al archivo máquina */

void addInstructionToFile(char* instruction){
	FILE* _file;
	char* name_file = "machine_code.txt";

	_file = fopen(name_file, "a");
	if (_file == NULL) return;

	fprintf(_file, "%s\n", instruction);
	fclose(_file);
}

/*************************************************************************/
/* Funcion que intercambia valores entre datos */

int* swap(int *data, int pos1, int pos2, int pos3) {
  int tmp = data[pos1];
  data[pos1] = data[pos2];
  data[pos2] = tmp;
  tmp = data[pos2];
  data[pos2] = data[pos3];
  data[pos3] = tmp;
  return data;
}

/*************************************************************************/
/* Elimina parentesis de las instrucciones de formato I */

int* deleteParent(int* data) {
  int* tmp_data;
  int index = 0;
  for (int i = 0; i < I_LENGTH; i++) {
    if (i != 3 || i != 5) {
       tmp_data[index] = data[i];
       printf("dato: %d\n", data[i]);
       index++;
    }
  }
  return tmp_data;
}

/*************************************************************************/
/* Funciones para analizar cada uno de los tipos de instrucciones propuestos */

/* Analiza instruccion de formato R */
void analizeInstructionR(int* data) {
  int* tmp_data;
  /* Ordena tokens en formato R */
  tmp_data = swap(data, 1, 2, 3);
  /* Convierte a binario y mete la instruccion al archivo maquina */
  char* r_instr = (char*) malloc( sizeof(char) * INSTR);
  for (int i = 0; i < R_LENGTH; i++) {
    if (i == 0) r_instr = concatenate(r_instr, convertBinary(tmp_data[i], 0) );
    else r_instr = concatenate(r_instr, convertBinary(tmp_data[i], -2) );
  }
  addInstructionToFile(r_instr);
  free(r_instr);
}

/* Analiza instruccion de formato I */
void analizeInstructionI(int* data) {
  int* tmp_data;
  /* Elimina token parentesis */
  tmp_data = deleteParent(data);
  /* Ordena tokens en formato I */
  tmp_data = swap(data, 1, 3, 2);
  /* Convierte a binario y mete la instruccion al archivo maquina */
  char* i_instr = (char*) malloc( sizeof(char) * INSTR);
  for (int i = 0; i < R_LENGTH; i++) {
    if (i == 0) i_instr = concatenate(i_instr, convertBinary(tmp_data[i], 0) );
    else if (i == 3) i_instr = concatenate(i_instr, convertBinary(tmp_data[i], 11) );
    else i_instr = concatenate(i_instr, convertBinary(tmp_data[i], -2) );
  }
  addInstructionToFile(i_instr);
  free(i_instr);
}

/* Analiza instruccion de formato J */
void analizeInstructionJ(int* data) {

}
