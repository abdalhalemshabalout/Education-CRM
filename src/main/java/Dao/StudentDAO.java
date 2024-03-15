package Dao;

import db.DBConnect;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
    public static Student getStudentById(int studentId) {
    	Student student = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, first_name, last_name, email, phone_number, enrollment_date, major FROM tb_students WHERE id = ?")) {

            stmt.setInt(1, studentId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    student = new Student();
                    student.setId(rs.getInt("id"));
                    student.setFirstName(rs.getString("first_name"));
                    student.setLastName(rs.getString("last_name"));
                    student.setEmail(rs.getString("email"));
                    student.setPhoneNumber(rs.getString("phone_number"));
                    student.setEnrollmentDate(rs.getString("enrollment_date"));
                    student.setMajor(rs.getString("major"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return student;
    }
    
    public static List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_students");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setFirstName(rs.getString("first_name"));
                student.setLastName(rs.getString("last_name"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phone_number"));
                student.setEnrollmentDate(rs.getString("enrollment_date"));
                student.setMajor(rs.getString("major"));
                students.add(student);
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }

        return students;
    }

    public static void saveStudent(Student student) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_students (first_name, last_name, email, phone_number, enrollment_date, major) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, student.getFirstName());
            stmt.setString(2, student.getLastName());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getPhoneNumber());
            stmt.setString(5, student.getEnrollmentDate());
            stmt.setString(6, student.getMajor());
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }
    
    public static boolean updateStudent(Student student) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_students SET first_name = ?, last_name = ?, email = ?, phone_number = ?, enrollment_date = ?, major = ? WHERE id = ?")) {

            stmt.setString(1, student.getFirstName());
            stmt.setString(2, student.getLastName());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getPhoneNumber());
            stmt.setString(5, student.getEnrollmentDate());
            stmt.setString(6, student.getMajor());

            stmt.setInt(7, student.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public static void deleteStudent(int studentId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_students WHERE id = ?")) {

            stmt.setInt(1, studentId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private static void handleSQLException(SQLException e) {
        e.printStackTrace();
        // Handle exception or log error as necessary
    }
}
