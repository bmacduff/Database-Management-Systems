<!DOCTYPE html>
<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Customers </title>

    <link rel="stylesheet" type="text/css" href="styles/customer.css">

</head>
<body>
<h1>
Add a customer 
</h1>

<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>    
</nav>


<form action="customer.php" method="POST">

  <label for="name">Name:</label>
  <input type="text" name="name" id="name">
  
  <label for="email">Email:</label>
  <input type="email" name="email" id="email">
  
  <label for="phone">Phone:</label>
  <input type="tel" name="phone" id="phone">

  <label for="street">Street:</label>
  <input type="text" name="street" id="street">
  
  <label for="city">City:</label>
  <input type="text" name="city" id="city">
  
  <label for="postalcode">Postal Code:</label>
  <input type="text" name="postalcode" id="postalcode">
  

<input type="submit" value="Add Customer">
</form>
<div>
<?php

$connection = new PDO('mysql:host=localhost;dbname=restaurantDB', "root", "");

$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$street = $_POST['street'];
$city = $_POST['city'];
$postalcode = $_POST['postalcode'];

$stmt = $connection->prepare("SELECT COUNT(*) FROM `Customer` WHERE `Customer_email` = :email");
$stmt->bindParam(':email', $email);
$stmt->execute();

if ($stmt->fetchColumn() > 0) {

    echo "<h2>Customer with email $email already exists in the database.</h2>";

} else {

    $stmt = $connection->prepare("INSERT INTO Customer VALUES (:name, :phone, :email, :street, :city, :postalcode, 5.00)");

    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':street', $street);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':postalcode', $postalcode);

    $stmt->execute();

    echo "<h2>Customer added successfully!</h2>";

}
$connection = NULL;
?>
</div>


</body>
</html>