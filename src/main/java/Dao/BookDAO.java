package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnect;
import model.Book;

public class BookDAO {
	
    public static Book getBookById(int bookId) {
    	Book book = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, title, author, publication_date, genre, publisher, pages, available FROM tb_books WHERE id = ?")) {

            stmt.setInt(1, bookId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                	book = new Book();
                    book.setId(rs.getInt("id"));
                    book.setTitle(rs.getString("title"));
                    book.setAuthor(rs.getString("author"));
                    book.setPublicationDate(rs.getString("publication_date"));
                    book.setGenre(rs.getString("genre"));
                    book.setPublisher(rs.getString("publisher"));
                    book.setPages(rs.getInt("pages"));
                    book.setAvailable(rs.getInt("available"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return book;
    }
    
    public static List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_books");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }

        return books;
    }

    public static boolean addBook(Book book) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_books (title, author, publication_date, genre, publisher, pages, available) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setString(3, book.getPublicationDate());
            stmt.setString(4, book.getGenre());
            stmt.setString(5, book.getPublisher());
            stmt.setInt(6, book.getPages());
            stmt.setInt(7, book.isAvailable());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
            return false;
        }
    }

    public static boolean updateBook(Book book) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_books SET title = ?, author = ?, publication_date = ?, genre = ?, publisher = ?, pages = ?, available = ? WHERE id = ?")) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setString(3, book.getPublicationDate());
            stmt.setString(4, book.getGenre());
            stmt.setString(5, book.getPublisher());
            stmt.setInt(6, book.getPages());
            stmt.setInt(7, book.isAvailable());

            stmt.setInt(8, book.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void deleteBook(int bookId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_books WHERE id = ?")) {

            stmt.setInt(1, bookId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private static Book mapResultSetToBook(ResultSet rs) throws SQLException {
        Book book = new Book();
        book.setId(rs.getInt("id"));
        book.setTitle(rs.getString("title"));
        book.setAuthor(rs.getString("author"));
        book.setPublicationDate(rs.getString("publication_date"));
        book.setGenre(rs.getString("genre"));
        book.setPublisher(rs.getString("publisher"));
        book.setPages(rs.getInt("pages"));
        book.setAvailable(rs.getInt("available"));
        return book;
    }
}
