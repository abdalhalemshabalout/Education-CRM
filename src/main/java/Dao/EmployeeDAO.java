package Dao;

import db.DBConnect;
import model.Book;
import model.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
	
    public static Employee getEmployeeById(int employeeId) {
    	Employee employee = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, first_name, last_name, email, phone_number, hire_date, department, salary FROM tb_employees WHERE id = ?")) {

            stmt.setInt(1, employeeId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    employee = new Employee();
                    employee.setId(rs.getInt("id"));
                    employee.setFirstName(rs.getString("first_name"));
                    employee.setLastName(rs.getString("last_name"));
                    employee.setEmail(rs.getString("email"));
                    employee.setPhoneNumber(rs.getString("phone_number"));
                    employee.setHireDate(rs.getString("hire_date"));
                    employee.setDepartment(rs.getString("department"));
                    employee.setSalary(rs.getBigDecimal("salary"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return employee;
    }
    
    public static List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_employees");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setFirstName(rs.getString("first_name"));
                employee.setLastName(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setPhoneNumber(rs.getString("phone_number"));
                employee.setHireDate(rs.getString("hire_date"));
                employee.setDepartment(rs.getString("department"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public static void saveEmployee(Employee employee) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_employees (first_name, last_name, email, phone_number, hire_date, department, salary) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, employee.getFirstName());
            stmt.setString(2, employee.getLastName());
            stmt.setString(3, employee.getEmail());
            stmt.setString(4, employee.getPhoneNumber());
            stmt.setString(5, employee.getHireDate());
            stmt.setString(6, employee.getDepartment());
            stmt.setBigDecimal(7, employee.getSalary());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
    
    public static boolean updateEmployee(Employee employee) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_employees SET first_name = ?, last_name = ?, email = ?, phone_number = ?, hire_date = ?, department = ?, salary = ? WHERE id = ?")) {

            stmt.setString(1, employee.getFirstName());
            stmt.setString(2, employee.getLastName());
            stmt.setString(3, employee.getEmail());
            stmt.setString(4, employee.getPhoneNumber());
            stmt.setString(5, employee.getHireDate());
            stmt.setString(6, employee.getDepartment());
            stmt.setBigDecimal(7, employee.getSalary());

            stmt.setInt(8, employee.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void deleteEmployee(int employeeId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_employees WHERE id = ?")) {

            stmt.setInt(1, employeeId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
