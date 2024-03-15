package web;

import Dao.CourseDAO;
import model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addCourse(request, response);
                break;
            case "delete":
            	deleteCourse(request, response);
                break;
            case "edit":
            	editCourse(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String courseName = request.getParameter("course_name");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String description = request.getParameter("description");
        String department = request.getParameter("department");

        Course course = new Course();
        course.setCourseName(courseName);
        course.setStartDate(startDate);
        course.setEndDate(endDate);
        course.setDescription(description);
        course.setDepartment(department);

        try {
            boolean added = CourseDAO.addCourse(course);

            if (added) {
                response.sendRedirect("CoursesList.jsp?message=success");
            } else {
                response.sendRedirect("AddCourse.jsp?message=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp");
        }
    }
    
    private void editCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String courseName = request.getParameter("course_name");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String description = request.getParameter("description");
        String department = request.getParameter("department");

        // Validate inputs
        if (courseName == null || courseName.isEmpty() || startDate == null || startDate.isEmpty() || endDate == null || endDate.isEmpty() ||
                description == null || description.isEmpty() || department == null || department.isEmpty()) {
            response.sendRedirect("EditCourse.jsp?courseId=" + courseId + "&message=error&error=Invalid input");
            return;
        }

        Course course = CourseDAO.getCourseById(courseId);
        if (course == null) {
            response.sendRedirect("EditCourse.jsp?courseId=" + courseId + "&message=error&error=Course not found");
            return;
        }

        course.setCourseName(courseName);
        course.setStartDate(startDate);
        course.setEndDate(endDate);
        course.setDescription(description);
        course.setDepartment(department);

        try {
            boolean updated = CourseDAO.updateCourse(course);
            redirectAfterOperation(response, updated, "CoursesList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditCourse.jsp?courseId=" + courseId + "&message=error&error=An unexpected error occurred");
        }
    }

    private void deleteCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        try {
            // Call the delete method in your DAO to delete the course
        	CourseDAO.deleteCourse(courseId);
            response.sendRedirect("CoursesList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CoursesList.jsp?message=error");
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
