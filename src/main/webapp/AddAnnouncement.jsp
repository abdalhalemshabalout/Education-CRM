<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Announcement</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="pagetitle mt-4">
        <nav class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Add Announcement</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                    <div class="alert alert-success" role="alert">
                        Announcement added successfully!
                    </div>
                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                    <div class="alert alert-danger" role="alert">
                        Failed to add announcement. Please try again.
                    </div>
                <% } %>

                <form action="AnnouncementServlet?action=add" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="title">Title:</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="content">Content:</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="AnnouncementsList.jsp" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function loadContent(url) {
            window.location.href = url;
        }
    </script>
</body>
</html>
