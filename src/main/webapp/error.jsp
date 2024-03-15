<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
        }

        h1 {
            color: #d9534f;
        }

        p {
            font-size: 18px;
        }

        .back-button {
            margin-top: 20px;
            background-color: #337ab7;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #286090;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <p>An error occurred while processing your request.</p>
        <p>Please try again later or contact support for assistance.</p>
        <a href="dashboard.jsp" class="back-button">Go to Dashboard</a>
    </div>
</body>
</html>
