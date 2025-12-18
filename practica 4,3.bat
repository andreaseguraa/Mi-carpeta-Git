1.  (la forma mas facil es pensar primero que necesitamos un bucle, ¿que tipo de bucle? se puede usar un for? si no me vale un buvcle for porque no se cuantas vueltas voy
a dar, voy a tner qeu usar un shift para indicar cuantas. ya se que necesito un shitft)

:eti1

xcopy %1 %2 /e
shift (se mueven los parámetros)
shift (como se han puesto 2 se van a mover 2 veces)
if %1.==.goto:eof  (esto se pone aqui para poder saber si el usuario ha metido datos o no. 
Esto sirve para indicar cuando se queda el parametro vacio oara parar de 
hacer el bucle) 

goto:eti1

pasos para hacer el ejercicio: leer el enuciado e ir pillando ideas como los tipos de bucle (si el enunciado lo pide),

Ejercicio específico:

:eti1
if %1.==. goto:eof 
if %2.==. goto:eof
xcopy %1 %2 /e
shift
shift


2. 
:eti1
echo creando usuarios %1
if %1.==. goto:eof
if %2.==. goto:eof
net user %1 /add
if %2 neq u (
    net localgroup %2 > nul
    if error level 2 net localgroup %2 /add
    net localgroup %2 %1 /add
)
shift
shift

goto:eti1






Notas generales:

%1.==. SIGNIFICA: el parametro esta vacio o cuando ya no me quedan mas parametros (dependiendo de si esta en un bucle o no)