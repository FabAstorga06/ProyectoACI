/* Registros establecidos en la arquitectura */
#define REG1 1
#define REG2 2
#define REG3 3
#define REG4 4
#define REG5 5
#define REG6 6
#define REG7 7
#define REG8 8
#define REG9 9
#define REG10 10
#define REG11 11
#define REG12 12
#define REG13 13
#define REG14 14
#define REG15 15
#define REG16 16

/* Longitudes de los tres formatos de instrucciones */
#define I_LENGTH 6
#define R_LENGTH 4
#define J_LENGTH 2
#define INSTR 32

/* Variables para reconocer
    los componentes de las instrucciones */

#define IMMEDIATE 17
#define DIRECTION 18
#define INDICATOR 100
#define PARENTESIS 19

/* Códigos de operación establecidos */

//Formato R
#define ADD 20
#define SUB 21
//Formato I
#define LW 22
#define SW 23
//Formato J
#define J 24
#define BNE 25
