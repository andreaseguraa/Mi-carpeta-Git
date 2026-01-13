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
Los de a continuacion se usan con | 
find "lo que voy buscando" (archivo donde quiero buscarlo)
sort
more

FOR /F "tokens" %%a IN (*.txt) DO ECHO (%%a, %%b, %%c)     Resultado: va a coger los 3 tokens

EJERICIOS
1.
FOR /F "tokens=1,2 delims=, EOL = -" %%a IN (ubica.txt) DO ECHO (%%a, %%b) // tambien se puede poner ECHO Nombre: %%a Ubicación: %%b 
(cuando se pone EOL es para decir (donde termina de kef)90=)=

2. 
FOR /F "tokens=1 deli= " %%a in (usus.txt) do net user %%a /add
FOR /F "tokens=1,2 delims= " %%a in (usus.txt) do (net user %%a /add & net localgroup %%b %%a /add)
FOR /F "tokens=1 delims= " %%a in (bvarios.txt) do net user %%a /del 


Teoria: 
3.
echo hola nombre: %1 y apellidos: %2 con edad %3
pause
call :DOS %1 %3

:DOS
echo confirmo que tu nombre es %1 y tu edad es %2
goto :DOS

:TRES

EJERCICIO 3

mal:
@echo off
xcopy %1 %2
if not exist %2 (
    echo el directorio no existe && creando directorio md %2 && type %2
)

bien (sin lo nuevo): 
@echo off
if not exist %2 ( 
        echo No existe %2, se crea.
        md %2
        xcopy %1 %2 /e
        call f2.bat %2
) else (
        xcopy %1 %2 /e
)

con lo nuevo:
@echo off
if not exist %2 
CALL ETI: %2

ETI:
(       echo No existe %2, se crea.
        md %2
        xcopy %1 %2 /e
)else( 
        xcopy %1 %2 /e
)

GOTO ETI:

4.
@echo off
ipconfig > temp
find "IPv4" temp > ip.txt
type ip.txt

otra forma:
@echo off
ipconfig | find "IPv4" > ip.txt


5.Macro llamada ip2.bat que muestre en pantalla sólo la/s dirección/es ip del equipo (sólo los números, ninguna
palabra). La salida será: xxx.xxx.xxx.xxx.
@echo off
ipconfig | find "IPv4" > ip.txt
FOR /F "tokens=2 delims=:" %%a IN (ip.txt) DO ECHO %%a

Para mostrar lo que hay antes de los :
ipconfig | find "IPv4" > ip.txt
FOR /F "tokens=1,2 delims=:" %%a IN (ip.txt) DO ECHO %%a       Si quisieramos mostrar lo que hay antes y despues de los : seria: FOR /F "tokens=1,2 delims=:" %%a IN (ip.txt) DO ECHO %%a %%b

Si quisiera hacerlo sin delimitador seria: 
@echo off
ipconfig | find "IPv4" > ip.txt
FOR /F "tokens=1-17" %%a IN (ip.txt) DO (ECHO %%q)


6. Macro que reciba como primer parámetro el nombre de un fichero y como segundo parámetro un número. 

La macro debe ordenar el fichero indicado y guardar la ordenación resultante en otro fichero llamado c.ord, donde
c es el número de columna por el que se ha ordenado el fichero. 

Este proceso debe repetirse empezando por la primera columna del fichero y terminando por la que se indique como parámetro al ejecutar la macro.

Ejemplo.- Si la macro se llama “ordena.bat”, la ejecución “ordena a.txt 4” debería generar cuatro ficheros
llamados 1.ord, 2.ord, 3.ord y 4.ord; ordenados respectivamente por la primera columna, la segunda, la tercera
y la cuarta.

Intento: 
@echo off

For /L %%x in (1,1,2) do (

IF %%x==1 do (For /f "tokens=1 delims=," %%a in (fich.txt) do sort %%a) > fichero1.txt

IF %%x==2 do (For /f "tokens=1,2 delims=," %%b in (fich.txt) do sort %%b) > fichero2.txt
)

Solucion ejercicio nombres y edades:
For /L %%x IN (1,1,2) DO (sort %1 /+%%x > %%x.ord)


7. Macro que reciba como parámetros una o varias direcciones IP y devuelva el/los nombres de Host
correspondientes:
@echo off
:eti1
if %1.==. goto:eof
echo direccion ip: %1
nslookup %1 | find "nombre"
shift
goto:eti1

for /f "delims=: tokens=2 %%a in ('ipconfig ^| find "IPv4"') do echo %%a


8. 
Type %1*.txt > %2\anexo.txt
type anexo.txt

forma 2:
for %%x in (%1*.txt) do type %%x >> %2\anexo.txt
type %2\anexo.txt
