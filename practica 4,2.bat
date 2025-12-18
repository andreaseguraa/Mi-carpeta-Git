1.

a) copy encurso*.txt copianual

b) copy *antes* copiaanterior 

c) del ?3 .*x*


2. 

ren ?a* ?x* 
ren ?b* ?x*
ren ?c* ?x*

3. TENER EN CUENTA HACERLO EN ORDEN DE MAYOR A MENOR, SIEMPRE PRIMERO EL 1 Y DESPUES EL 0
ping 8.8.8.8 -n 1
if errorlevel 1 (echo no tienes conexion a internet) else (echo si tienes conexion)

Para probar: %errorlevel%


4. 
net user %1
if errrorlevel 2 (echo el usuario %1 no existe) else (echo el usuario %1 existe)


(notas ej)
net user profesor (para ver la info de usuario existente)
net user andrea /add (para crear un usuario nuevo)
net user %1 > nul (va a mostrar menos mensajes de errores)


5.
Comp sirve para comparar archivos. Se escribe: comp archivo1 archivo2


APUNTES

copy a* carpeta: va a copiar todos los archivos que empiecen por a a la carpeta especificada. Así no se puede especificar un fichero concreto. 
Para poder indicar ficheros concretos que queremos copiar (en este caso), vamos a usar FOR.
    La estrucutura básica de un bucle es:
        PARA x=1 HASTA 20
        Esto es un bucle que va a estar haciendo lo mismo hasta que se se cumpla la condicion.

    La estructura de FOR es:
        FOR %%x(serie de ficheros (pepe.txt, hola.txt)) DO (TYPE %%x)

    Ejemplo práctico
        FOR %%x ( *.txt ) do (
            echo Contenido del fichero %%x:
            type %%x
            pause
            cls
        )
        
6. 
if %1.==. echo falta indicar destino & goto eof   (si el usuario ha metido algo)
	if not exist %1 md %1  (SE COMPRUEBA SI EXISTE Y SI NO EXISTE LO CREO CON MD)
	for %%x in (%2*) do (echo copiando archivo %%x & copy %%x %1)  (SE COPIAN LOS FICHEROS QUE COINCIDEN CON EL PATRON %2)

Aclaración: el for %%x in (%2*) sirve para indicar que la variable %2* va a pasar a ser %%x, 
es decir, si pusiera a* en vez de %2*, %%x tomaría uno de los valores a los que equivale a* 
(tomariía el primer archivo que empieza por a, luego el siguiente..)


7. 
for %%x in (a*) do (
        type %%x
        echo seguimos?
        choice /c sn
        if errorlevel 2 (echo. & echo terminamos & goto:eof)
)

8. 
FOR %%x in (*.*) DO (
    echo info sobre el fichero %%x
    echo nombre: %%~nx
    echo extension: %%~xx
    echo fecha y hora: %%~tx
    echo tamaño: %%~zx
    echo. 
)


COMO LIMITAR UN FOR:
se puede hacer con una "etiqueta". Se hace de la siguiente manera:
:ETI 1
    condiciones a añadir:
    IF _____ GOTO:EOF
goto:ETI1

:eti1
if %1.==.goto:EOF
echo hola %1
shift 
goto:eti 1


(notas           generales)
ren = rename
-n1 (hacer un solo envio de paquete)


