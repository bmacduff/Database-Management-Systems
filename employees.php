<html lang = "en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title> Employees </title>

    <link rel="stylesheet" type="text/css" href="styles/employees.css">

</head>
<body>

<h1>
See an employees weekday schedule
</h1>

<h2>
  Just choose your employee and click view
</h2>
<nav>
    <a href="http://localhost/Final Project/restaurant.html">Home</a>
    <a href="http://localhost/Final Project/menu.php">Menus</a>
    <a href="http://localhost/Final Project/orders.php">Orders</a>
    <a href="http://localhost/Final Project/customer.php">Customers</a>
    <a href="http://localhost/Final Project/employees.php">Employees</a>
</nav>

<form method="post" action="schedule.php">
  <label for="employee">Select an employee:</label>
  <select name="employee" id="employee">
    <?php

      $connection = new PDO('mysql:host=localhost;dbname=restaurantDB', 'root', '');
      $sql = 'SELECT Employee_ID, Employee_name FROM Employee';
      $result = $connection->query($sql);

      while ($row = $result->fetch()) {
        echo '<option value="' . $row['Employee_ID'] . '">' . $row['Employee_name'] . '</option>';
      }
      
      $connection = null;
    ?>
  </select>
  <button type="submit">View</button>
</form>

</body>
</html>