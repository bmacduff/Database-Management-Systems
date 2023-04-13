<!DOCTYPE html>
<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Orders </title>

    <link rel="stylesheet" type="text/css" href="styles/orders.css">

</head>
<body>
<h1>Orders</h1>
<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>    
</nav>

<form action="orderdates.php" method="get" class = "ViewDates">
  <input type="hidden" name="date" value="<?php echo $date; ?>">
  <button type="submit">View Order Dates</button>
</form>

<form action="orders.php" method="GET" class = "SeeOrder">
    <label for="date">Enter a date (YYYY-MM-DD):</label>
    <input type="text" name="date" id="date">
    <input type="submit" value="Search">

</form>
<div>
<?php

$date = $_GET['date'];


$connection= new PDO('mysql:host=localhost;dbname=restaurantDB', "root", "");


$stmt = $connection->prepare("
SELECT c.Customer_name, 
        GROUP_CONCAT(DISTINCT oi.Name_of_food ORDER BY oi.Name_of_food SEPARATOR ', ') AS Food_ordered,
        o.Tip, 
        e.Employee_name, 
        o.Order_price 
        FROM `Orders` o 
INNER JOIN `OrderContains` oi ON o.Order_ID = oi.Order_ID
INNER JOIN `Customer` c ON o.Customer_email = c.Customer_email
INNER JOIN `Employee` e ON o.Delivery_ID = e.Employee_ID
WHERE DATE(o.Order_date) = :date
GROUP BY o.Order_ID;");

$stmt->bindParam(':date', $date);
$result = $stmt->execute();
?>

<table>
<tr><th>Customer Name</th><th>Food Ordered</th><th>Tip</th><th>Delivery Person</th><th>Total Price</th></tr>
<?php
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    echo '<td>' . $row['Customer_name'] . '</td>';
    echo '<td>' . $row['Food_ordered'] . '</td>';
    echo '<td>' . $row['Tip'] . '</td>';
    echo '<td>' . $row['Employee_name'] . '</td>';
    echo '<td>' . $row['Order_price'] . '</td>';
    echo '</tr>';
}
?>
</table>

</div>


</body>
</html>