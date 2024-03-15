package web;

import java.io.IOException;

import Dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addBook(request, response);
                break;
            case "delete":
            	deleteBook(request, response);
                break;
            case "edit":
            	editBook(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publicationDate = request.getParameter("publication_date");
        String genre = request.getParameter("genre");
        String publisher = request.getParameter("publisher");
        int pages = Integer.parseInt(request.getParameter("pages"));
        int available = Integer.parseInt(request.getParameter("available"));

        Book book = new Book(0, title, author, publicationDate, genre, publisher, pages, available);

        try {
            boolean added = BookDAO.addBook(book);

            if (added) {
                response.sendRedirect("BooksList.jsp?message=success");
            } else {
                response.sendRedirect("AddBook.jsp?message=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); 
        }
    }
    
    private void editBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publicationDate = request.getParameter("publication_date");
        String genre = request.getParameter("genre");
        String publisher = request.getParameter("publisher");
        int pages;
        int available;

        try {
            // Parse integer parameters, handle NumberFormatException if parsing fails
            pages = Integer.parseInt(request.getParameter("pages"));
            available = Integer.parseInt(request.getParameter("available"));
        } catch (NumberFormatException e) {
            response.sendRedirect("EditBook.jsp?bookId=" + bookId + "&message=error&error=Invalid input for pages or available");
            return;
        }

        // Validate inputs
        if (title == null || title.isEmpty() || author == null || author.isEmpty() || publicationDate == null || publicationDate.isEmpty() || genre == null || genre.isEmpty()
                || publisher == null || publisher.isEmpty()) {
            response.sendRedirect("EditBook.jsp?bookId=" + bookId + "&message=error&error=Invalid input");
            return;
        }

        Book book = BookDAO.getBookById(bookId);
        if (book == null) {
            response.sendRedirect("EditBook.jsp?bookId=" + bookId + "&message=error&error=Book not found");
            return;
        }

        book.setTitle(title);
        book.setAuthor(author);
        book.setPublicationDate(publicationDate);
        book.setGenre(genre);
        book.setPublisher(publisher);
        book.setPages(pages);
        book.setAvailable(available);
        
        try {
            boolean updated = BookDAO.updateBook(book);
            redirectAfterOperation(response, updated, "BooksList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditBook.jsp?bookId=" + bookId + "&message=error&error=An unexpected error occurred");
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        try {
            // Call the delete method in your DAO to delete the book
        	BookDAO.deleteBook(bookId);
            response.sendRedirect("BooksList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("BooksList.jsp?message=error");
        }
    }
    
    // Method to handle redirection after an operation
    private void redirectAfterOperation(HttpServletResponse response, boolean success, String redirectPage) throws IOException {
        if (success) {
            response.sendRedirect(redirectPage + "?message=success");
        } else {
            response.sendRedirect(redirectPage + "?message=error&error=Failed to perform the operation");
        }
    }

}
