<%@ page import="Dao.CourseDAO" %>
<%@ page import="model.Course" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    // Fetch the course ID from the URL parameter
    int courseId = Integer.parseInt(request.getParameter("courseId"));
    // Fetch the courseId details based on the ID
    Course course = CourseDAO.getCourseById(courseId);
    if (course == null) {
        // If announcement is not found, redirect to a error page or handle appropriately
        response.sendRedirect("error.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Course</title>
    <link rel="stylesheet" type="text/css" href="components/dashboard.css">
    <link rel="stylesheet" type="text/css" href="components/style.css">

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <%@include file="NavBar.jsp"%>

    <!-- Page content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Importing Sidebar -->
            <jsp:include page="SideBar.jsp"/>
            <!-- End of Sidebar -->

            <!-- Main content -->
            <main id="main-content" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"></div>
                <div class="pagetitle mt-4">
                    <nav class="d-flex justify-content-between align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Edit Course</li>
                        </ol>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card shadow">
                            <div class="card-body">
                                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                                    <div class="alert alert-success" role="alert">
                                        Announcement edited successfully!
                                    </div>
                                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        Failed to edit announcement. Please try again.
                                    </div>
                                <% } %>
                <form action="CourseServlet?action=edit" method="post">
                    <!-- Course Name and Department -->
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="course_name">Course Name:</label>
                            <input type="text" class="form-control" id="course_name" name="course_name" value="<%= course.getCourseName() %>" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="department">Department:</label>
                            <input type="text" class="form-control" id="department" name="department" value="<%= course.getDepartment() %>" required>
                        </div>
                    </div>
                    <!-- Start Time and End Time -->
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="start_date">Start Date:</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" value="<%= course.getStartDate() %>" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="end_date">End Date:</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" value="<%= course.getEndDate() %>" required>
                        </div>
                    </div>
                    <!-- Description -->
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="description">Description:</label>
                            <textarea class="form-control" id="description" name="description" rows="5" required><%= course.getDescription() %></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="courseId" value="<%= course.getId() %>">
                    <!-- Submit and Cancel buttons -->
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="CoursesList.jsp" class="btn btn-danger">Cancel</a>
                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
