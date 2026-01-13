
El comando attrib sirve para ver o modificar los atributos de uno o varios ficheros o directorios.
Los atributos pueden ser: h (archivo oculto), r (archivo de sólo lectura), s (archivo de sistema) o a (listo para archivar).
Se usa añadiendo + o -, según se quiera poner o quitar el atributo, a la letra en cuestión.

Por ejemplo.- attrib +h pepe.txt, automaticamente ocultaría el fichero pepe.txt.


Enunciado:

Macro llamada atributos que asigne el atributo indicado como primer parámetro a todos los archivos del directorio actual que cumplan las condiciones indicadas como 2º parámetro.

Por ejemplo.- la ejecución atributos +r *.txt pondría como sólo lectura a todos los ficheros con extensión txt.

La macro debe controlar que el usuario ha indicado los parámetros al ejecutar la macro.

@echo off
if %1-/+*.*==-/+*.* (echo "No has metido un parámetro válido")
for %%x*.* in (%2) do attrib %1 %%x %2 

Resolucion:
@echo off

if %1.==. echo ERROR: debe indicar el atributo que se va a asignar & goto :eof

if %2.==. echo ERROR: debe indicar un nombre de archivo o una plantilla & goto :eof

attrib %1 %2

Ejercicio 2

Vamos a hacer una macro cuyo enunciado es prácticamente igual al anterior, sin embargo, comprobarás al hacerla que añadir un pequeño detalle en el enunciado cambia bastante la forma de hacer la macro.

Enunciado

Hacer una macro llamada atributos2 que haga lo mismo que la anterior pero además, antes de cambiar el atributo a cada fichero, debe mostrar su nombre precedido de la frase: Procesado Fichero: 

Observa que ahora no puedes usar directamente la orden attrib con los comodines pues no tendrías forma de mostrar el nombre de cada fichero antes de cambiar el atributo.

¿Qué tendrás que hacer para localizar el primer fichero, escribir su nombre y cambiar el atributo; luego pasar al segundo, escribir nombre y atributo; pasar al tercero, etc. y así, hasta que no haya más ficheros que cumplan las condiciones?

Al igual que antes, piénsala primero tú solo/a, hazla y pruébala. Luego puedes pasar a la página siguiente donde la tienes resuelta.


Resolucion
@echo off

cls

if %1.==. echo ERROR: debe indicar el atributo que se va a asignar & goto :eof

if %2.==. echo ERROR: debe indicar un nombre de archivo o una plantilla & goto :eof

for %%v in (%2) do echo PROCESADO FICHERO: %%v & echo. & attrib %1 %%v

