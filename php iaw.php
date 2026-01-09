<h1>Taquería PHP</h1>


<form action="cocina.php" method="POST">
   
    <label>¿Cuántos tacos quieres?</label>
    <br>


    <select name="cantidad_tacos">
        <?php
        // Bucle simple: Cuenta del 1 al 10
        for ($i = 1; $i <= 10; $i++) {
            echo "<option value='$i'>Quiero $i tacos</option>";
        }
        ?>
    </select>


    <br><br>
    <input type="submit" value="¡Marchar orden!">


</form>

