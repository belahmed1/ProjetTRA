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

// Add new product
if (isset($_POST['add_product'])) {
    $product_name = $_POST['product_name'];
    $quantity = $_POST['quantity'];
    $date_added = $_POST['date_added'];
    $location = $_POST['location'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO Produits (Nom_produit, Quantite, Date_ajout, Emplacement) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("siss", $product_name, $quantity, $date_added, $location);

    // Set parameters and execute
    $product_name = $_POST['product_name'];
    $quantity = $_POST['quantity'];
    $date_added = $_POST['date_added'];
    $location = $_POST['location'];
    $stmt->execute();

    echo "New product added successfully!";
}
?>

<!-- Add product form -->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <label for="product_name">Product name:</label><br>
    <input type="text" id="product_name" name="product_name"><br>
    <label for="quantity">Quantity:</label><br>
    <input type="number" id="quantity" name="quantity"><br>
    <label for="date_added">Date added:</label><br>
    <input type="date" id="date_added" name="date_added"><br>
    <label for="location">Location:</label><br>
    <input type="text" id="location" name="location"><br>
    <input type="submit" name="add_product" value="Ajouter un nouveau produit">
</form>

<!-- Display inventory -->
<table border="1">
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