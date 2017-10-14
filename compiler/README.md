Compilador creado en C. 

Traduce un conjunto de instrucciones y las convierte a lenguaje máquina.

Para ejecutar el compilador, abra una terminal en Linux, ubíquese en la carpeta donde se encuentra el Makefile y ejecute los siguientes comandos:

- $ make
- $ ./scanner <config.in

Posteriormente, para generar un archivo compatible con el funcionamiento del procesador (.hex file), introduzca los siguientes comandos: 

- $ cd ihex-master
- $ ./bin2ihex <machine_code.bin >machine_code.hex



