<!DOCTYPE html>
<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Restaurants </title>

    <link rel="stylesheet" type="text/css" href="styles/schedule.css">

</head>


<body>

<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>
</nav>
<?php

echo "<h1> This week's schedule </h1>";
$connection= new PDO('mysql:host=localhost;dbname=restaurantDB', "root", "");
$employee_id = $_POST['employee'];

$sql = "SELECT Schedule_day, Schedule_starttime, Schedule_endtime 
        FROM Schedule 
        WHERE DAYOFWEEK(Schedule_day) BETWEEN 2 AND 6 AND Employee_ID = :employee_id";

$stmt = $connection->prepare($sql);
$stmt->bindParam(':employee_id', $employee_id);

$stmt->execute();
?>
]
<table class="center">
    <tr>
        <th>Schedule Day</th>
        <th>Start Time</th>
        <th>End Time</th>
    </tr>
<?php

while($shift = $stmt->fetch()) {
    echo "<tr><td>" . $shift["Schedule_day"] . "</td><td>" . $shift["Schedule_starttime"] . "</td><td>" . $shift["Schedule_endtime"] . "</td></tr>";
}

$connection = NULL;
?>
</table>

</body>

</html>