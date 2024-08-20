<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Schedule</title>
</head>
<body>

<form action="updateSchedule" method="post">
    Bus ID: <input type="text" name="bus_id" value="<%= request.getParameter("bus_id") %>"><br>
    Departure Time: <input type="time" name="departure_time"><br>
    Arrival Time: <input type="time" name="arrival_time"><br>
    Start Point: <input type="text" name="start_point"><br>
    End Point: <input type="text" name="end_point"><br>
    <input type="submit" value="Update Schedule">
</form>

</body>
</html>
