<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="pagetitle mt-4">
        <nav class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Add Book</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <% if (request.getParameter("message") != null && request.getParameter("message").equals("success")) { %>
                    <div class="alert alert-success" role="alert">
                        Book added successfully!
                    </div>
                <% } else if (request.getParameter("message") != null && request.getParameter("message").equals("error")) { %>
                    <div class="alert alert-danger" role="alert">
                        Failed to add book. Please try again.
                    </div>
                <% } %>
                
                <form action="BookServlet?action=add" method="post">
                	<div class="row">
                    <div class="form-group col-6">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="author">Author:</label>
                        <input type="text" class="form-control" id="author" name="author" required>
                    </div>
                    </div>
                    <div class="form-group">
                        <label for="publication_date">Publication Date:</label>
                        <input type="date" class="form-control" id="publication_date" name="publication_date" required>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre:</label>
                        <input type="text" class="form-control" id="genre" name="genre" required>
                    </div>
                    <div class="form-group">
                        <label for="publisher">Publisher:</label>
                        <input type="text" class="form-control" id="publisher" name="publisher" required>
                    </div>
                    <div class="row">
                    <div class="form-group col-6">
                        <label for="pages">Pages:</label>
                        <input type="number" class="form-control" id="pages" name="pages" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="available">Available:</label>
                        <select class="form-control" id="available" name="available" required>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    </div>
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="BooksList.jsp" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
