<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h3 {
            color: #dc3545;
        }
        fieldset {
            width: 400px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table td {
            padding: 6px;
        }
        input[type="submit"] {
            padding: 6px 15px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<h1>Delete customer</h1>
<h3>Are you sure?</h3>
<p>
    <a href="customers">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${customer.name}</td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${customer.email}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${customer.address}</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
