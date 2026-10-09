<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Calculator</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 350px;
            margin: auto;
            padding: 25px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h2 {
            text-align: center;
            color: #333333;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: #e8f5e9;
            border-radius: 5px;
        }

        .error {
            margin-top: 15px;
            color: red;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>JSP Calculator</h2>

    <form method="post">

        <label for="num1">First Number:</label>
        <input
                type="number"
                id="num1"
                name="num1"
                step="any"
                value="<%= request.getMethod().equals("POST") && request.getParameter("num1") != null
                        ? request.getParameter("num1") : "" %>"
                required>

        <label for="num2">Second Number:</label>
        <input
                type="number"
                id="num2"
                name="num2"
                step="any"
                value="<%= request.getMethod().equals("POST") && request.getParameter("num2") != null
                        ? request.getParameter("num2") : "" %>"
                required>

        <button type="submit">Calculate</button>

    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {

            String value1 = request.getParameter("num1");
            String value2 = request.getParameter("num2");

            if (value1 == null || value2 == null
                    || value1.trim().isEmpty()
                    || value2.trim().isEmpty()) {
    %>

                <p class="error">Please enter both numbers.</p>

    <%
            } else {

                try {

                    double num1 = Double.parseDouble(value1);
                    double num2 = Double.parseDouble(value2);

                    if (!Double.isFinite(num1) || !Double.isFinite(num2)) {
    %>

                        <p class="error">Please enter valid finite numbers.</p>

    <%
                    } else {
                        double sum = num1 + num2;
                        double difference = num1 - num2;
                        double product = num1 * num2;
    %>

                        <div class="result">

                            <h3>Calculation Results</h3>

                            <p>
                                <strong>First Number:</strong>
                                <%= num1 %>
                            </p>

                            <p>
                                <strong>Second Number:</strong>
                                <%= num2 %>
                            </p>

                            <p>
                                <strong>Sum:</strong>
                                <%= sum %>
                            </p>

                            <p>
                                <strong>Difference:</strong>
                                <%= difference %>
                            </p>

                            <p>
                                <strong>Product:</strong>
                                <%= product %>
                            </p>

                            <p>
                                <strong>Division:</strong>
                                <%
                                    if (num2 != 0) {
                                        out.print(num1 / num2);
                                    } else {
                                        out.print("Cannot divide by zero");
                                    }
                                %>
                            </p>

                        </div>

    <%
                    }

                } catch (NumberFormatException e) {
    %>

                    <p class="error">Please enter valid numbers.</p>

    <%
                }
            }
        }
    %>

</div>

</body>
</html>