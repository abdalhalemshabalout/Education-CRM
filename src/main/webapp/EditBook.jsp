<%@ page import="Dao.BookDAO" %>
<%@ page import="model.Book" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    // Fetch the book ID from the URL parameter
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    // Fetch the book details based on the ID
    Book book = BookDAO.getBookById(bookId);
    if (book == null) {
        // If announcement is not found, redirect to a error page or handle appropriately
        response.sendRedirect("error.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Book</title>
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
                            <li class="breadcrumb-item active">Edit Book</li>
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
                <form action="BookServlet?action=edit" method="post">
                	<div class="row">
                    <div class="form-group col-6">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%= book.getTitle() %>" required>
                    </div>
                    <div class="form-group col-6">
                        <label for="author">Author:</label>
                        <input type="text" class="form-control" id="author" name="author" value="<%= book.getAuthor() %>"  required>
                    </div>
                    </div>
                    <div class="form-group">
                        <label for="publication_date">Publication Date:</label>
                        <input type="date" class="form-control" id="publication_date" name="publication_date" value="<%= book.getPublicationDate() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre:</label>
                        <input type="text" class="form-control" id="genre" name="genre" value="<%= book.getGenre() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="publisher">Publisher:</label>
                        <input type="text" class="form-control" id="publisher" name="publisher" value="<%= book.getPublisher() %>" required>
                    </div>
                    <div class="row">
                    <div class="form-group col-6">
                        <label for="pages">Pages:</label>
                        <input type="number" class="form-control" id="pages" name="pages" value="<%= book.getPages() %>"required>
                    </div>
                    <div class="form-group col-6">
                        <label for="available">Available:</label>
                        <select class="form-control" id="available" name="available" <%= book.isAvailable() %> required>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    </div>
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                    <button type="submit" class="btn btn-success">Edit</button>
                    <a href="BooksList.jsp" class="btn btn-danger">Cancel</a>
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
