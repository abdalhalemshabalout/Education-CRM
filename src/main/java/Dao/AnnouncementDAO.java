package Dao;

import db.DBConnect;
import model.Announcement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

public class AnnouncementDAO {

    public static Announcement getAnnouncementById(int announcementId) {
        Announcement announcement = null;
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, title, content, created_at FROM tb_announcements WHERE id = ?")) {

            stmt.setInt(1, announcementId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    announcement = new Announcement();
                    announcement.setId(rs.getInt("id"));
                    announcement.setTitle(rs.getString("title"));
                    announcement.setContent(rs.getString("content"));
                    announcement.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }
        return announcement;
    }

    public static List<Announcement> getAllAnnouncements() {
        List<Announcement> announcements = new ArrayList<>();

        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("SELECT id, title, content, created_at FROM tb_announcements");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Announcement announcement = new Announcement();
                announcement.setId(rs.getInt("id"));
                announcement.setTitle(rs.getString("title"));
                announcement.setContent(rs.getString("content"));
                announcement.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                announcements.add(announcement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
        }

        return announcements;
    }

    public static boolean addAnnouncement(Announcement announcement) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO tb_announcements (title, content, created_at) VALUES (?, ?, ?)")) {

            stmt.setString(1, announcement.getTitle());
            stmt.setString(2, announcement.getContent());
            stmt.setTimestamp(3, Timestamp.valueOf(announcement.getCreatedAt()));

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log error as necessary
            return false;
        }
    }

    public static boolean updateAnnouncement(Announcement announcement) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("UPDATE tb_announcements SET title = ?, content = ? WHERE id = ?")) {

            stmt.setString(1, announcement.getTitle());
            stmt.setString(2, announcement.getContent());
            stmt.setInt(3, announcement.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void deleteAnnouncement(int announcementId) {
        try (Connection conn = DBConnect.getConn();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM tb_announcements WHERE id = ?")) {

            stmt.setInt(1, announcementId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
