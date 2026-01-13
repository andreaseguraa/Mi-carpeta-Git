<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $_SESSION['numero_mesa'] = $_POST['numero_mesa'];
    $_SESSION['tacos_guardados'] = $_POST['tacos'];
}
?>

<!DOCTYPE html>
<head>
    <title>Pedido de tacos</title>
</head>
<body>

    <h2>Orden</h2>

    <form action="" method="POST">
        <label for="numero_mesa">Número de mesa</label><br>
        <input type="text" name="numero_mesa" required>
        <br><br>

        <label for="tacos">¿Cuántos tacos quieres?</label><br>
        <select name="tacos">

            <?php
            for ($i = 1; $i <= 99; $i++) {
                echo "<option value='$i'>Quiero $i tacos</option>";
            }
            ?>

        </select>
        <br><br>
        <input type="submit" value="Enviar orden">
    </form>

    <hr>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $numero_mesa = $_POST['numero_mesa'];
        $tacos   = $_POST['tacos'];

        echo "<h3>Resultado:</h3>";
        echo "Orden de <b>$tacos</b> tacos mandada para la mesa número: <b>$numero_mesa</b>";
    }
    ?>
</body>
</html>




Datos tacos
<?php
session_start();


function cocinarTacos($cantidad, $mesa) {
    echo "Se están cocinando " . $cantidad . " tacos para la mesa " . $mesa;
}

isset($_SESSION['numero_mesa'], $_SESSION['tacos_guardados']) && 
    cocinarTacos($_SESSION['tacos_guardados'], $_SESSION['numero_mesa']);

?>



