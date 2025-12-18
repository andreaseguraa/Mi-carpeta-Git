ejemplo simple: for %%x in (*.txt) do echo %%x

Para ver el contenido de un archivo se usa FOR /F

Contenido del fichero llamado a.txt:
    mesa, 10, azul
    silla, 20, rojo
    sillon, 30, verde

Para indicar la informacioón que queremos sacar de manera exclusiva, se pone entre "" en el comando. Quedaría asi:
    FOR /F "tokens" %%a IN (*.txt) DO ECHO (%%a) 


skip=n : especifica el número de lineas que se van a omitir al principio del archivo. Skip=3 : omite las tres primeras lineas del archivo.
tokens=x,y,m-n: token = campo. Indica cuantos token y en que orden se cogen. Si se pone 1,3 se coge el primer y el tercer token. Si se pone m-n se cogen los tokens desde el m hasta el n
delims=xxx: con algo puesto significa qué es lo que va a delimitar cada token. Por ejemplo: delims=,  : indica que la coma es la que delimita los tokens.
usebackq: se usa cuando el nombre del archivo está entre comillas invertidas (` `) o si el nombre del archivo tiene espacios.
eol=c : a partir de que caracter quiero que no haga caso.

FOR /F "tokens" %%a IN (*.txt) DO ECHO (%%a, %%b, %%c)     Resultado: va a coger los 3 tokens

EJERICIOS
1.
FOR /F "tokens=1,2 delims=," %%a IN (ubica.txt) DO ECHO (%%a, %%b) // tambien se puede poner ECHO Nombre: %%a Ubicación: %%b 

2. 
FOR /F "tokens=1 delims= " %%a in (usus.txt) do net user %%a /add
FOR /F "tokens=1,2 delims= " %%a in (usus.txt) do net user %%a /add net localgroup %%b /add


