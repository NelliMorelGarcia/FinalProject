<html>
<head>
    <title>Restaurant Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header, .footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .nav {
            margin: 20px 0;
            text-align: center;
        }
        .nav a {
            margin: 0 10px;
            color: black;
            text-decoration: none;
            font-weight: bold;
        }
        .nav a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to Our Restaurant</h1>
        <p>Your satisfaction is our priority</p>
    </div>

    <div class="nav">
    
        <a href="addReserversion.php">Add Reservation</a> |
        <a href="viewReserversions.php">View Reservations</a> |
        <a href="addSpecialRequest.php">Add Special Request</a> |
        <a href="findReservations.php">Find Reservations</a> |
        <a href="deleteReservation.php">Delete Reservation</a> |
        <a href="searchPreferences.php">Search Preferences</a>
    </div>

    <div class="footer">
        <p>&copy; 2024 Our Restaurant. All rights reserved.</p>
    </div>
</body>
</html>


  