<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
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
        .label {
            font-weight: bold;
            width: 100px;
        }
    </style>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="customers">Back to customer list</a>
</p>
<fieldset>
    <legend>Customer information</legend>
    <table>
        <tr>
            <td class="label">Name: </td>
            <td>${customer.name}</td>
        </tr>
        <tr>
            <td class="label">Email: </td>
            <td>${customer.email}</td>
        </tr>
        <tr>
            <td class="label">Address: </td>
            <td>${customer.address}</td>
        </tr>
    </table>
</fieldset>
</body>
</html>
