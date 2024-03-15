<%@ page import="Dao.StudentDAO" %>
<%@ page import="model.Student" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    // Fetch the student ID from the URL parameter
    int studentId = Integer.parseInt(request.getParameter("studentId"));
    // Fetch the student details based on the ID
    Student student = StudentDAO.getStudentById(studentId);
    if (student == null) {
        // If employee is not found, redirect to a error page or handle appropriately
        response.sendRedirect("error.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
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
                            <li class="breadcrumb-item active">Edit Student</li>
                        </ol>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card shadow">
                            <div class="card-body">
                                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                                    <div class="alert alert-success" role="alert">
                                        student edited successfully!
                                    </div>
                                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        Failed to edit student. Please try again.
                                    </div>
                                <% } %>
                <form action="StudentServlet?action=edit" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="first_name">First Name:</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" value="<%= student.getFirstName() %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="last_name">Last Name:</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" value="<%= student.getLastName() %>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= student.getEmail() %>"required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone_number">Phone Number:</label>
                            <input type="tel" class="form-control" id="phone_number" name="phone_number" value="<%= student.getPhoneNumber() %>"required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="enrollment_date">Enrollment Date:</label>
                            <input type="date" class="form-control" id="enrollment_date" name="enrollment_date" value="<%= student.getEnrollmentDate() %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="major">Major:</label>
                            <input type="text" class="form-control" id="major" name="major" value="<%= student.getMajor() %>" required>
                        </div>
                    </div>
                    <input type="hidden" name="studentId" value="<%= student.getId() %>">
                    <!-- Submit and Cancel buttons -->
                    <button type="submit" class="btn btn-success">Edit</button>
					<a href="EmployeesList.jsp" class="btn btn-danger">Cancel</a>
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
