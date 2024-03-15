package Dao;

import db.DBConnect;
import model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
	
    public static Course getCourseById(int courseId) {
    	Course course = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, course_name, start_date, end_date, description, department FROM tb_courses WHERE id = ?")) {

            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    course = new Course();
                    course.setId(rs.getInt("id"));
                    course.setCourseName(rs.getString("course_name"));
                    course.setStartDate(rs.getString("start_date"));
                    course.setEndDate(rs.getString("end_date"));
                    course.setDescription(rs.getString("description"));
                    course.setDepartment(rs.getString("department"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return course;
    }
    
    public static List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_courses");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseName(rs.getString("course_name"));
                course.setStartDate(rs.getString("start_date"));
                course.setEndDate(rs.getString("end_date"));
                course.setDescription(rs.getString("description"));
                course.setDepartment(rs.getString("department"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }

        return courses;
    }

    public static boolean addCourse(Course course) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_courses (course_name, start_date, end_date, description, department) VALUES (?, ?, ?, ?, ?)")) {

            stmt.setString(1, course.getCourseName());
            stmt.setString(2, course.getStartDate());
            stmt.setString(3, course.getEndDate());
            stmt.setString(4, course.getDescription());
            stmt.setString(5, course.getDepartment());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
            return false;
        }
    }
    
    public static boolean updateCourse(Course course) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_courses SET course_name = ?, start_date = ?, end_date = ?, description = ?, department = ? WHERE id = ?")) {

            stmt.setString(1, course.getCourseName());
            stmt.setString(2, course.getStartDate());
            stmt.setString(3, course.getEndDate());
            stmt.setString(4, course.getDescription());
            stmt.setString(5, course.getDepartment());
            stmt.setInt(6, course.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void deleteCourse(int courseId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_courses WHERE id = ?")) {

            stmt.setInt(1, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
