 #include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include "constants.h"

/*************************************************************************/
/* Convierte un numero de base decimal a base binaria */

char* convertBinary(unsigned int num, int pivot, int digits) {
	unsigned int index = 0;
	unsigned int bit = 1U << (sizeof(unsigned int) + pivot);
	char* bin = (char*) malloc( sizeof(char) * digits);

	/***AQUI ESTA EL ERROR****/
	while ( bit ) {
			bin[index] = (num & bit) ? '1' : '0';
			//printf("binaria longitud: %d\n", strlen(bin));
			bit >>= 1;
			index++;
	}
	return bin;
}

/*************************************************************************/
/* Funcion para concatenar dos cadenas de caracteres */

char* concatenate(const char *s1, const char *s2)
{
    char* result = (char*) malloc(sizeof(char) * (strlen(s1) + strlen(s2)));
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

int* swap(int *data, int pos1, int pos2) {
  int tmp = data[pos1];
  data[pos1] = data[pos2];
  data[pos2] = tmp;
  tmp = data[pos2];

  return data;
}

/*************************************************************************/
/* Funcion que enceuntra una direccion de memoria */

char* deleteChar(char* param, int len) {
  char* tmp_param = (char*) malloc(sizeof(char) * 15);
  for (int i = 0; i < len; i++) {
    if(param[i] == ':' || param[i] == '.') break;
    else tmp_param[i] = param[i];
  }
  return tmp_param;
}

int findAddress(char* target, char*** mem_adrrs) {
  int address = 0;
  char* tmp_target = deleteChar(target, 15);
  char* tmp_adrrs;
  for (int i = 0; i < 10; i++) {
    tmp_adrrs = deleteChar(mem_adrrs[i][0], 15);
    int ret = strcmp(tmp_adrrs, tmp_target);
    if (ret == 0) {
        address = atoi(mem_adrrs[i][1]);
        break;
    }
  }
  return address;
}

/*************************************************************************/
/* Funciones para analizar cada uno de los tipos de instrucciones propuestos */

/* Analiza instruccion de formato R */
void analizeInstructionR(int* data) {
  int* tmp_data;
  char* r_instr = (char*) malloc( sizeof(char) * INSTR );
  /* Instrucciones SLL, SRL, ... */
  if (data[0] == SLL || data[0] == SRL) {
    /* Ordena tokens en formato R */
    tmp_data = swap(data, 1, 2);
    /* Convierte a binario y mete la instruccion al archivo maquina */
    for (int i = 0; i < R_LENGTH; i++) {
      if (i == 0 || i == 3) r_instr = concatenate(r_instr, convertBinary(tmp_data[i], 0, 5) );
      else if (i == 1) {
        r_instr = concatenate(r_instr, "0000" ); /* rs no existe */
        r_instr = concatenate(r_instr, convertBinary(tmp_data[i], -1, 4) );
      }
      else r_instr = concatenate(r_instr, convertBinary(tmp_data[i], -1, 4) );
    }
    r_instr = concatenate(r_instr, "0000000000" ); /* agrega funct */
  }
  /*************************************************************/
  /* Instrucciones ADD, SUB, ... */
  else {
    /* Ordena tokens en formato R */
    tmp_data = swap(data, 1, 2);
    tmp_data = swap(data, 2, 3);
    /* Convierte a binario y mete la instruccion al archivo maquina */
    for (int i = 0; i < R_LENGTH; i++) {
      if (i == 0) r_instr = concatenate(r_instr, convertBinary(tmp_data[i], 0, 5) );
      else r_instr = concatenate(r_instr, convertBinary(tmp_data[i], -1, 4) );
    }
    r_instr = concatenate(r_instr, "000000000000000" );
  }

  addInstructionToFile(r_instr);
  free(r_instr);
}

/* Analiza instruccion de formato I */
void analizeInstructionI(int* data) {
  /* Convierte a binario y mete la instruccion al archivo maquina */
  char* i_instr = (char*) malloc( sizeof(char) * INSTR);
  /* Instrucciones BEQ, BNE, ... */
  if (data[0] == BEQ || data[0] == BNE) {
    for (int i = 0; i < R_LENGTH; i++) {
      if (i == 0) i_instr = concatenate(i_instr, convertBinary(data[i], 0, 5) );
      else if (i == 3) i_instr = concatenate(i_instr, convertBinary(data[i], 14, 19) );
      else i_instr = concatenate(i_instr, convertBinary(data[i], -1, 4) );
    }
  }
  /*************************************************************/
  /* Instrucciones LW, SW, ... */
  else {
    int* tmp_data = (int*) malloc(sizeof(int) * R_LENGTH);
    /* Ordena tokens en formato I */
    tmp_data = swap(data, 1, 3);
    tmp_data = swap(data, 2, 3);
    for (int i = 0; i < R_LENGTH; i++) {
      if (i == 0) i_instr = concatenate(i_instr, convertBinary(tmp_data[i], 0, 5) );
      else if (i == 3) i_instr = concatenate(i_instr, convertBinary(tmp_data[i], 14, 19) );
      else i_instr = concatenate(i_instr, convertBinary(tmp_data[i], -1, 4) );
    }
  }

  addInstructionToFile(i_instr);
  free(i_instr);
}

/* Analiza instruccion de formato J */
void analizeInstructionJ(int* data, int address) {
  /* Convierte a binario y mete la instruccion al archivo maquina */
  char* j_instr = (char*) malloc( sizeof(char)* INSTR);
  /*opcode*/
  j_instr = concatenate(j_instr, convertBinary(data[0], 0, 5) );
  /*direccion*/
  j_instr = concatenate(j_instr, convertBinary(address, 22, 27) );
  addInstructionToFile(j_instr);
  free(j_instr);
}

/* Crea la instrucción NOP para realizar un stall */
void noOperation() {
  char* instr = (char*) malloc(sizeof(char) * INSTR);
  instr = concatenate(instr, "11111" );
  instr = concatenate(instr, "000000000000000000000000000" );
  addInstructionToFile(instr);
  free(instr);
}
