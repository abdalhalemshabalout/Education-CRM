package Dao;

import db.DBConnect;
import model.Lesson;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LessonDAO {
	
    public static Lesson getLessonById(int lessonId) {
    	Lesson lesson = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, lesson_name, start_time, end_time, classroom, department FROM tb_lessons WHERE id = ?")) {

            stmt.setInt(1, lessonId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    lesson = new Lesson();
                    lesson.setId(rs.getInt("id"));
                    lesson.setLessonName(rs.getString("lesson_name"));
                    lesson.setStartTime(rs.getString("start_time"));
                    lesson.setEndTime(rs.getString("end_time"));
                    lesson.setClassroom(rs.getString("classroom"));
                    lesson.setDepartment(rs.getString("department"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return lesson;
    }
    
    public static List<Lesson> getAllLessons() {
        List<Lesson> lessons = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tb_lessons");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setId(rs.getInt("id"));
                lesson.setLessonName(rs.getString("lesson_name"));
                lesson.setStartTime(rs.getString("start_time"));
                lesson.setEndTime(rs.getString("end_time"));
                lesson.setClassroom(rs.getString("classroom"));
                lesson.setDepartment(rs.getString("department"));
                lessons.add(lesson);
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }

        return lessons;
    }

    public static boolean addLesson(Lesson lesson) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_lessons (lesson_name, start_time, end_time, classroom, department) VALUES (?, ?, ?, ?, ?)")) {

            stmt.setString(1, lesson.getLessonName());
            stmt.setString(2, lesson.getStartTime());
            stmt.setString(3, lesson.getEndTime());
            stmt.setString(4, lesson.getClassroom());
            stmt.setString(5, lesson.getDepartment());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            handleSQLException(e);
            return false;
        }
    }

    public static boolean updateLesson(Lesson lesson) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_lessons SET lesson_name = ?, start_time = ?, end_time = ?, classroom = ?, department = ? WHERE id = ?")) {

            stmt.setString(1, lesson.getLessonName());
            stmt.setString(2, lesson.getStartTime());
            stmt.setString(3, lesson.getEndTime());
            stmt.setString(4, lesson.getClassroom());
            stmt.setString(5, lesson.getDepartment());

            stmt.setInt(6, lesson.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void deleteLesson(int lessonId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_lessons WHERE id = ?")) {

            stmt.setInt(1, lessonId);
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
