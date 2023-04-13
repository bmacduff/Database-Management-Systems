<!DOCTYPE html>
<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Menu </title>

    <link rel="stylesheet" type="text/css" href="styles/menu.css">

</head>
<body>

<h1>
Our Menus
</h1>
<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>    
</nav>

<?php 
    $connection = new PDO('mysql:host=localhost;dbname=restaurantDB', 'root', '');
    $query = "SELECT Restaurant.Restaurant_name, RestaurantOffers.Name_of_food, RestaurantOffers.Menu_price
    FROM Restaurant
    INNER JOIN RestaurantOffers ON Restaurant.Restaurant_URL = RestaurantOffers.Restaurant_URL
    ORDER BY Restaurant.Restaurant_name";

$result = $connection->query($query);

$current_restaurant = null;
?>

<table class='center'>
<tr><th>Restaurant</th><th>Food Name</th><th>Price</th></tr>
<?php
while ($row = $result->fetch()) {
    $restaurant_name = $row['Restaurant_name'];
    $food_name = $row['Name_of_food'];
    $price = $row['Menu_price'];

    echo "<tr><td>{$restaurant_name}</td><td>{$food_name}</td><td>{$price}</td></tr>";
}
?>
</table>



</body>
</html>