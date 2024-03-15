<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Lesson</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="pagetitle mt-4">
        <nav class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Add Lesson</li>
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
                            Lesson added successfully!
                        </div>
                    <% } else if (request.getParameter("message").equals("error")) { %>
                        <div class="alert alert-danger" role="alert">
                            Failed to add lesson. Please try again.
                        </div>
                    <% } %>
                <% } %>
                <form action="LessonServlet?action=add" method="post">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="lesson_name">Lesson Name:</label>
                            <input type="text" class="form-control" id="lesson_name" name="lesson_name" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="start_time">Start Time:</label>
                            <input type="datetime-local" class="form-control" id="start_time" name="start_time" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="end_time">End Time:</label>
                            <input type="datetime-local" class="form-control" id="end_time" name="end_time" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="classroom">Classroom:</label>
                            <input type="text" class="form-control" id="classroom" name="classroom" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="department">Department:</label>
                            <input type="text" class="form-control" id="department" name="department" required>
                        </div>
                    </div> 
            
                    <!-- Submit and Cancel buttons -->
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="LessonsList.jsp" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
