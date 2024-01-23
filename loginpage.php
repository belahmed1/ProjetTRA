<?php
$mysqli = new mysqli("localhost", "username", "password", "database_name");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="pagelogin.css">
</head>
<body>
    <h1 class="welc">Welcome</h1>
    <div class="login-container">
        <h2>Login</h2>
        <form action=" <?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="input-field">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-field">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="submit-btn">
                <input type="submit" value="Login">
            </div>
        </form>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $username = $_POST['username'];
            $password = $_POST['password'];

            $query = "SELECT * FROM users WHERE username = ?";
            $stmt = $mysqli->prepare($query);
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                if (password_verify($password, $row['password'])) {
                    echo "<p>Login successful!</p>";
                } else {
                    echo "<p>Invalid password.</p>";
                }
            } else {
                echo "<p>Invalid username.</p>";
            }

            $stmt->close();
        }
        ?>
    </div>
</body>
</html>
<?php
$mysqli->close();
?>
