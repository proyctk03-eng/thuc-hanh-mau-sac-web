<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            margin-top: 50px;
            background-color: #f8fafc;
        }
        .calculator-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 380px;
        }
        h2 {
            color: #1b2a7a;
            margin-top: 0;
            text-align: center;
        }
        fieldset {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 6px;
        }
        legend {
            font-weight: bold;
            color: #1b2a7a;
            padding: 0 8px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 8px 4px;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #1b2a7a;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #121c54;
        }
    </style>
</head>
<body>
    <div class="calculator-container">
        <h2>Simple Calculator</h2>
        <form action="calculate" method="POST">
            <fieldset>
                <legend>Calculator</legend>
                <table>
                    <tr>
                        <td>First operand:</td>
                        <td><input type="text" name="first-operand" placeholder="Enter first number" required /></td>
                    </tr>
                    <tr>
                        <td>Operator:</td>
                        <td>
                            <select name="operator">
                                <option value="+">Addition (+)</option>
                                <option value="-">Subtraction (-)</option>
                                <option value="*">Multiplication (*)</option>
                                <option value="/">Division (/)</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Second operand:</td>
                        <td><input type="text" name="second-operand" placeholder="Enter second number" required /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Calculate" /></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</body>
</html>
