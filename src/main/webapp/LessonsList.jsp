<%@page import="Dao.LessonDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Lesson"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>school management system</title>
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
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  </div>
<div class="pagetitle mt-4">
    <nav class="d-flex justify-content-between align-items-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
            <li class="breadcrumb-item active">Lessons List</li>
        </ol>
        <!-- Link to add lesson page -->
          <a onclick="loadContent('AddLesson.jsp'); setActive(this);" class="btn btn-info">Add</a>
    </nav>
</div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"></h5>
                    <!-- Table with stripped rows -->
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Lesson Name</th>
                            <th scope="col">Start Time</th>
                            <th scope="col">End Time</th>
                            <th scope="col">Classroom</th>
                            <th scope="col">Department</th>
                            <th scope="col">Actions</th> <!-- New column for actions -->
                        </tr>
                        </thead>
                        <tbody>
                            <%  
                                List<Lesson> lessons = LessonDAO.getAllLessons();
                                int counter = 1;
                                for (Lesson lesson : lessons) {
                            %>
                                <tr>
                                    <td><%= counter++ %></td>
                                    <td><%= lesson.getLessonName() %></td>
                                    <td><span class="text-success"><%= lesson.getStartTime() %></span></td>
                                    <td><span class="text-danger"><%= lesson.getEndTime() %></span></td>  
                                    <td><%= lesson.getClassroom() %></td>
                                    <td><%= lesson.getDepartment() %></td>
                                    <td>
                                        <a href="EditLesson.jsp?lessonId=<%= lesson.getId() %>" class="btn btn-success btn-sm">Edit</a>                                      
                                        <button class="btn btn-danger btn-sm" onclick="deleteRow(<%= lesson.getId() %>)">Delete</button>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
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

  <!-- Custom JavaScript for loading content dynamically -->
<script>
    function loadContent(url) {
        fetch(url)
            .then(response => response.text())
            .then(html => {
                document.getElementById('main-content').innerHTML = html;
            });
    }
    function deleteRow(lessonId) {
        if (confirm("Are you sure you want to delete this lesson?")) {
            fetch('LessonServlet', {
                method: 'POST',
                body: 'action=delete&lessonId=' + lessonId,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }).then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                }
            }).catch(error => {
                console.error('Error:', error);
            });
        }
    }
</script>

</body>
</html>

