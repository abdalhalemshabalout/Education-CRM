package web;

import Dao.AnnouncementDAO;
import model.Announcement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/AnnouncementServlet")
public class AnnouncementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addAnnouncement(request, response);
                break;
            case "edit":
                editAnnouncement(request, response);
                break;
            case "delete":
                deleteAnnouncement(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }

    private void addAnnouncement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Validate inputs
        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            response.sendRedirect("AddAnnouncement.jsp?message=error&error=Invalid input");
            return;
        }

        LocalDateTime createdAt = LocalDateTime.now(); // Assuming current time as creation time
        Announcement announcement = new Announcement(0, title, content, createdAt);

        try {
            boolean added = AnnouncementDAO.addAnnouncement(announcement);
            redirectAfterOperation(response, added, "AnnouncementsList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddAnnouncement.jsp?message=error&error=An unexpected error occurred");
        }
    }

    private void editAnnouncement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int announcementId = Integer.parseInt(request.getParameter("announcementId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Validate inputs
        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            response.sendRedirect("EditAnnouncement.jsp?announcementId=" + announcementId + "&message=error&error=Invalid input");
            return;
        }

        Announcement announcement = AnnouncementDAO.getAnnouncementById(announcementId);
        if (announcement == null) {
            response.sendRedirect("EditAnnouncement.jsp?announcementId=" + announcementId + "&message=error&error=Announcement not found");
            return;
        }

        announcement.setTitle(title);
        announcement.setContent(content);

        try {
            boolean updated = AnnouncementDAO.updateAnnouncement(announcement);
            redirectAfterOperation(response, updated, "AnnouncementsList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditAnnouncement.jsp?announcementId=" + announcementId + "&message=error&error=An unexpected error occurred");
        }
    }

    private void deleteAnnouncement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int announcementId = Integer.parseInt(request.getParameter("announcementId"));
        try {
            AnnouncementDAO.deleteAnnouncement(announcementId);
            response.sendRedirect("AnnouncementsList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AnnouncementsList.jsp?message=error&error=An unexpected error occurred");
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
