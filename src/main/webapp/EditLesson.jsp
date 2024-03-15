<%@ page import="Dao.LessonDAO" %>
<%@ page import="model.Lesson" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    // Fetch the lesson ID from the URL parameter
    int lessonId = Integer.parseInt(request.getParameter("lessonId"));
    // Fetch the lessonId details based on the ID
    Lesson lesson = LessonDAO.getLessonById(lessonId);
    if (lesson == null) {
        // If lesson is not found, redirect to a error page or handle appropriately
        response.sendRedirect("error.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Lesson</title>
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
                            <li class="breadcrumb-item active">Edit Lesson</li>
                        </ol>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card shadow">
                            <div class="card-body">
                                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                                    <div class="alert alert-success" role="alert">
                                        lesson edited successfully!
                                    </div>
                                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        Failed to edit lesson. Please try again.
                                    </div>
                                <% } %>
                      <form action="LessonServlet?action=edit" method="post">
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="lesson_name">Lesson Name:</label>
                            <input type="text" class="form-control" id="lesson_name" name="lesson_name"  value="<%= lesson.getLessonName() %>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="start_time">Start Time:</label>
                            <input type="datetime-local" class="form-control" id="start_time" name="start_time" value="<%= lesson.getStartTime() %>" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="end_time">End Time:</label>
                            <input type="datetime-local" class="form-control" id="end_time" name="end_time" value="<%= lesson.getEndTime() %>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="classroom">Classroom:</label>
                            <input type="text" class="form-control" id="classroom" name="classroom" value="<%= lesson.getClassroom() %>" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="department">Department:</label>
                            <input type="text" class="form-control" id="department" name="department" value="<%= lesson.getDepartment() %>" required>
                        </div>
                    </div> 
                     <input type="hidden" name="lessonId" value="<%= lesson.getId() %>">
                    <!-- Submit and Cancel buttons -->
                    <button type="submit" class="btn btn-success">Edit</button>
                    <a href="LessonsList.jsp" class="btn btn-danger">Cancel</a>
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
