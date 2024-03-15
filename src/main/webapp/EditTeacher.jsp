<%@ page import="Dao.TeacherDAO" %>
<%@ page import="model.Teacher" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    // Fetch the teacher ID from the URL parameter
    int teacherId = Integer.parseInt(request.getParameter("teacherId"));
    // Fetch the teacher details based on the ID
    Teacher teacher = TeacherDAO.getTeacherById(teacherId);
    if (teacher == null) {
        // If employee is not found, redirect to a error page or handle appropriately
        response.sendRedirect("error.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher</title>
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
                            <li class="breadcrumb-item active">Edit Teacher</li>
                        </ol>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card shadow">
                            <div class="card-body">
                                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                                    <div class="alert alert-success" role="alert">
                                        teacher edited successfully!
                                    </div>
                                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        Failed to edit teacher. Please try again.
                                    </div>
                                <% } %>
                <form action="TeacherServlet?action=edit" method="post">
                    <div class="form-group">
                        <label for="department">Department:</label>
                        <input type="text" class="form-control" id="department" name="department" value="<%= teacher.getDepartment() %>" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="first_name">First Name:</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" value="<%= teacher.getFirstName() %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="last_name">Last Name:</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" value="<%= teacher.getLastName() %>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= teacher.getEmail() %>"required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone_number">Phone Number:</label>
                            <input type="tel" class="form-control" id="phone_number" name="phone_number" value="<%= teacher.getPhoneNumber() %>"required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="hire_date">Hire Date:</label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date" value="<%= teacher.getHireDate() %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="salary">Salary:</label>
                            <input type="number" class="form-control" id="salary" name="salary" step="0.01" value="<%= teacher.getSalary() %>" required>
                        </div>
                    </div>
                    <input type="hidden" name="teacherId" value="<%= teacher.getId() %>">
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
