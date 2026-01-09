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

