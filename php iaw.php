<?php

session_start();

$_SESSION['usuario'] = 'cliente1';
$_SESSION['rol'] = 'cliente';

//Muestro por pantalla el contenido de las variables

$usuario = $_GET['usuario'];
echo "Usuario recibido: $usuario";

$rol = $_GET['rol'];
echo "Rol asignado: $rol";

// Elimino los datos de la sesión
session_unset();

//Destruyo la sesión

if (session_destroy()) {
    echo "Se ha cerrado la sesión";
}

?>




// La base de datos se va a llamar examen.

<?php
$servidor = "localhost";
$usuario = "usuario_bd";
$password = "password_bd";
$basedatos = "examen";

$conexion = mysqli_connect($servidor, $usuario, $password, $examen);

$sql = "SELECT nombre, apellidos, email FROM clientes";
$resultado = mysqli_query($conexion, $sql);

echo "<table border='1'>";
echo "<tr><th>Nombre</th><th>Apellidos</th><th>Email</th></tr>";

while ($fila = mysqli_fetch_assoc($resultado)) {

    echo "<tr>";
    echo "<td>" . $fila["nombre"] . "</td>";
    echo "<td>" . $fila["apellidos"] . "</td>";
    echo "<td>" . $fila["email"] . "</td>";
    echo "</tr>";

}
echo "</table>";

?>



