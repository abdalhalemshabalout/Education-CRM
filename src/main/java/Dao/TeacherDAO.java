package Dao;

import db.DBConnect;
import model.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {
	
    public static Teacher getTeacherById(int teacherId) {
    	Teacher teacher = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, first_name, last_name, email, phone_number, hire_date, department, salary FROM tb_teachers WHERE id = ?")) {

            stmt.setInt(1, teacherId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    teacher = new Teacher();
                    teacher.setId(rs.getInt("id"));
                    teacher.setFirstName(rs.getString("first_name"));
                    teacher.setLastName(rs.getString("last_name"));
                    teacher.setEmail(rs.getString("email"));
                    teacher.setPhoneNumber(rs.getString("phone_number"));
                    teacher.setHireDate(rs.getString("hire_date"));
                    teacher.setDepartment(rs.getString("department"));
                    teacher.setSalary(rs.getBigDecimal("salary"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return teacher;
    }
    
    public static List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_teachers");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Teacher teacher = new Teacher();
                teacher.setId(rs.getInt("id"));
                teacher.setFirstName(rs.getString("first_name"));
                teacher.setLastName(rs.getString("last_name"));
                teacher.setEmail(rs.getString("email"));
                teacher.setPhoneNumber(rs.getString("phone_number"));
                teacher.setHireDate(rs.getString("hire_date"));
                teacher.setDepartment(rs.getString("department"));
                teacher.setSalary(rs.getBigDecimal("salary"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }

        return teachers;
    }
    
    public static void saveTeacher(Teacher teacher) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_teachers (first_name, last_name, email, phone_number, hire_date, department, salary) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, teacher.getFirstName());
            stmt.setString(2, teacher.getLastName());
            stmt.setString(3, teacher.getEmail());
            stmt.setString(4, teacher.getPhoneNumber());
            stmt.setString(5, teacher.getHireDate());
            stmt.setString(6, teacher.getDepartment());
            stmt.setBigDecimal(7, teacher.getSalary());
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    public static boolean updateTeacher(Teacher teacher) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_teachers SET first_name = ?, last_name = ?, email = ?, phone_number = ?, hire_date = ?, department = ?, salary = ? WHERE id = ?")) {

            stmt.setString(1, teacher.getFirstName());
            stmt.setString(2, teacher.getLastName());
            stmt.setString(3, teacher.getEmail());
            stmt.setString(4, teacher.getPhoneNumber());
            stmt.setString(5, teacher.getHireDate());
            stmt.setString(6, teacher.getDepartment());
            stmt.setBigDecimal(7, teacher.getSalary());
            stmt.setInt(8, teacher.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void deleteTeacher(int teacherId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_teachers WHERE id = ?")) {

            stmt.setInt(1, teacherId);
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
