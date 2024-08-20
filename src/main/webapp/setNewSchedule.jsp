<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Set New Schedule</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="time"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            cursor: pointer;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #444;
        }
    </style>
</head>
<body>

<form action="newSchedule" method="post">
    Bus ID: <input type="text" name="bus_id" value="<%= request.getParameter("bus_id") %>"><br>
    Departure Time: <input type="time" name="departure_time"><br>
    Arrival Time: <input type="time" name="arrival_time"><br>
    Start Point: <input type="text" name="start_point"><br>
    End Point: <input type="text" name="end_point"><br>
    <input type="submit" value="Set Schedule">
</form>

</body>
</html>
