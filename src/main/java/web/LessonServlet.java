package web;

import Dao.LessonDAO;
import model.Lesson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LessonServlet")
public class LessonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addLesson(request, response);
                break;
            case "delete":
            	deleteLesson(request, response);
                break;
            case "edit":
            	editLesson(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve lesson details from the request parameters
        String lessonName = request.getParameter("lesson_name");
        String startTime = request.getParameter("start_time");
        String endTime = request.getParameter("end_time");
        String classroom = request.getParameter("classroom");
        String department = request.getParameter("department");
        
        // Create a new Lesson object with the retrieved details
        Lesson lesson = new Lesson();
        lesson.setLessonName(lessonName);
        lesson.setStartTime(startTime);
        lesson.setEndTime(endTime);
        lesson.setClassroom(classroom);
        lesson.setDepartment(department);
        
        // Add the lesson to the database using LessonDAO
        boolean added = LessonDAO.addLesson(lesson);
        
        // Redirect to appropriate page based on the result
        if (added) {
            response.sendRedirect("LessonsList.jsp?message=success");
        } else {
            response.sendRedirect("AddLesson.jsp?message=error");
        }
    }
    
    private void editLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        String lessonName = request.getParameter("lesson_name");
        String startTime = request.getParameter("start_time");
        String endTime = request.getParameter("end_time");
        String classroom = request.getParameter("classroom");
        String department = request.getParameter("department");

        // Validate inputs
        if (lessonName == null || lessonName.isEmpty() || startTime == null || startTime.isEmpty() || endTime == null || endTime.isEmpty() ||
                classroom == null || classroom.isEmpty() || department == null || department.isEmpty()) {
            response.sendRedirect("EditLesson.jsp?lessonId=" + lessonId + "&message=error&error=Invalid input");
            return;
        }

        Lesson lesson = LessonDAO.getLessonById(lessonId);
        if (lesson == null) {
            response.sendRedirect("EditLesson.jsp?lessonId=" + lessonId + "&message=error&error=Lesson not found");
            return;
        }

        lesson.setLessonName(lessonName);
        lesson.setStartTime(startTime);
        lesson.setEndTime(endTime);
        lesson.setClassroom(classroom);
        lesson.setDepartment(department);

        try {
            boolean updated = LessonDAO.updateLesson(lesson);
            redirectAfterOperation(response, updated, "LessonsList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditLesson.jsp?lessonId=" + lessonId + "&message=error&error=An unexpected error occurred");
        }
    }

    private void deleteLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        try {
            // Call the delete method in your DAO to delete the lesson
        	LessonDAO.deleteLesson(lessonId);
            response.sendRedirect("LessonsList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("LessonsList.jsp?message=error");
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
