<%@ page import="java.util.List" %>
<%@page import="Dao.CourseDAO"%>
<%@page import="model.Course"%>

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

<script>
  function setActive(link) {
    // Remove 'active' class from all links
    var links = document.querySelectorAll('.nav-link');
    links.forEach(function(item) {
      item.classList.remove('active');
    });
    // Add 'active' class to the clicked link
    link.classList.add('active');
  }
</script>
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
<div class="row">
  <div class="col-lg-12">
    <div class="row">
      <h4><strong>Courses</strong></h4>
      <div class="row">
        <%  
          List<Course> courses = CourseDAO.getAllCourses();
          for (Course course : courses) {
        %>
        <div class="col-lg-4 mb-4">
          <div class="card shadow">
            <div class="card-body">
              <h5 class="card-title"><%= course.getCourseName() %></h5>
              <ul class="list-unstyled">
                <li><strong>Start Time:</strong> <span class="text-success"><%= course.getStartDate() %></span></li>
                <li><strong>End Time:</strong> <span class="text-danger"><%= course.getEndDate() %></span></li>
                <li><strong>Description:</strong> <%= course.getDescription() %></li>
                <li><strong>Department:</strong> <%= course.getDepartment() %></li>
              </ul>
            </div>
          </div>
        </div>
        <% } %>
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
</script>

</body>
</html>
