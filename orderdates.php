<!DOCTYPE html>
<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Restaurants </title>

    <link rel="stylesheet" type="text/css" href="styles/orderdates.css">

</head>


<body>
<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>
</nav>
<h1> These are how many orders were placed on these dates</h1>

<?php
    
    $connection= new PDO('mysql:host=localhost;dbname=restaurantDB', "root", "");
    $sql = "SELECT DATE(Order_date) AS Order_date, COUNT(*) AS Num_orders FROM Orders GROUP BY DATE(Order_date)";

    $result = $connection->query($sql);

?>
    

<table class="center">
    <tr>
        <th>Date</th>
        <th>Number of orders</th>
    </tr>
    <?php
    while ($row = $result->fetch()) {
        echo "<tr><td>" . $row["Order_date"] . "</td><td>" . $row["Num_orders"] . "</td></tr>";
    }
    ?>
</table>
<?php
    $connection = NULL;
?>

</body>

</html>