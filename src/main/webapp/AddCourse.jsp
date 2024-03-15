<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Course</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="pagetitle mt-4">
        <nav class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Add Course</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <!-- Display message -->
                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                    <div class="alert alert-success" role="alert">
                        Course added successfully!
                    </div>
                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                    <div class="alert alert-danger" role="alert">
                        Failed to add course. Please try again.
                    </div>
                <% } %>

                <!-- Form for adding a new course -->
                <form action="CourseServlet?action=add" method="post">
                    <!-- Course Name and Department -->
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="course_name">Course Name:</label>
                            <input type="text" class="form-control" id="course_name" name="course_name" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="department">Department:</label>
                            <input type="text" class="form-control" id="department" name="department" required>
                        </div>
                    </div>
                    <!-- Start Time and End Time -->
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="start_date">Start Date:</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="end_date">End Date:</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" required>
                        </div>
                    </div>
                    <!-- Description -->
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="description">Description:</label>
                            <textarea class="form-control" id="description" name="description" rows="5" required></textarea>
                        </div>
                    </div>
                    <!-- Submit and Cancel buttons -->
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="CoursesList.jsp" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
