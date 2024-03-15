<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Teacher</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="pagetitle mt-4">
        <nav class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Add Teacher</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <!-- Display message -->
                <% if (request.getParameter("message") != null) { %>
                    <% if (request.getParameter("message").equals("success")) { %>
                        <div class="alert alert-success" role="alert">
                            Teacher added successfully!
                        </div>
                    <% } else if (request.getParameter("message").equals("error")) { %>
                        <div class="alert alert-danger" role="alert">
                            Failed to add teacher. Please try again.
                        </div>
                    <% } %>
                <% } %>
                <form action="TeacherServlet?action=add" method="post">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="department">Department:</label>
                            <input type="text" class="form-control" id="department" name="department">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="first_name">Name:</label>
                            <input type="text" class="form-control" id="first_name" name="first_name">
                        </div>
                        <div class="form-group col-6">
                            <label for="last_name">Surname:</label>
                            <input type="text" class="form-control" id="last_name" name="last_name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group col-6">
                            <label for="phone_number">Phone Number:</label>
                            <input type="tel" class="form-control" id="phone_number" name="phone_number">
                        </div>
                    </div> 
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="hire_date">Hire Date:</label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date">
                        </div>
                        <div class="form-group col-6">
                            <label for="salary">Salary:</label>
                            <input type="number" class="form-control" id="salary" name="salary">
                        </div>
                    </div>   
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="TeachersList.jsp" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
