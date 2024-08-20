<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

    input[type="text"] {
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

<form action="editRoute" method="post">
    Route ID: <input type="text" name="route_id" value="<%= request.getParameter("route_id") %>"><br>
    New Duration (minutes): <input type="text" name="new_duration"><br>
    <input type="submit" value="Edit Duration">
</form>

</body>
</html>