<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
<div>

    <h1> Inventaire </h1>
    <button type="button">Ajouter un nouveau produit</button>
    

</div>

<table >
    <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Date added</th>
        <th>Location</th>
    </tr>
    <?php
    $sql = "SELECT * FROM Produits";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["Nom_produit"]. "</td><td>" . $row["Quantite"]. "</td><td>" . $row["Date_ajout"]. "</td><td>" . $row["Emplacement"]. "</td></tr>";
        }
    } else {
        echo "0 results";
    }

    $conn->close();
    ?>
</table>
