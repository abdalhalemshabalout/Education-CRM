<%@ page import="java.util.List" %>
<%@ page import="Dao.AnnouncementDAO" %>
<%@ page import="model.Announcement" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

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
            <li class="breadcrumb-item active">Announcements List</li>
        </ol>
        <a href="AddAnnouncement.jsp" class="btn btn-info">Add</a>
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
                            <th scope="col">Title</th>
                            <th scope="col">Content</th>
                            <th scope="col">Created At</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%  
                                List<Announcement> announcements = AnnouncementDAO.getAllAnnouncements();
                                int counter = 1;
                                for (Announcement announcement : announcements) {
                                    // Format the date as yyyy-MM-dd HH:mm:ss
                                    LocalDateTime createdAt = announcement.getCreatedAt();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                                    String formattedDate = createdAt.format(formatter);
                            %>
                                <tr>
                                    <td><%= counter++ %></td>
                                    <td><%= announcement.getTitle() %></td>
                                    <td><%= announcement.getContent() %></td>
                                    <td><%= formattedDate %></td>
                                    <td>
                                        <a href="EditAnnouncement.jsp?announcementId=<%= announcement.getId() %>" class="btn btn-success btn-sm">Edit</a>
                                      	<button class="btn btn-danger btn-sm" onclick="deleteRow(<%= announcement.getId() %>)">Delete</button>
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
    function deleteRow(announcementId) {
        if (confirm("Are you sure you want to delete this Announcement?")) {
            fetch('AnnouncementServlet', {
                method: 'POST',
                body: 'action=delete&announcementId=' + announcementId,
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
