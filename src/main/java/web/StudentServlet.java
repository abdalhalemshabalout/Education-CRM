package web;

import Dao.StudentDAO;
import model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addStudent(request, response);
                break;
            case "delete":
            	deleteStudent(request, response);
                break;
            case "edit":
            	editStudent(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve student details from the request parameters
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String enrollmentDate = request.getParameter("enrollment_date");
        String major = request.getParameter("major");
        
        // Create a new Student object with the retrieved details
        Student student = new Student();
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setEmail(email);
        student.setPhoneNumber(phoneNumber);
        student.setEnrollmentDate(enrollmentDate);
        student.setMajor(major);
        
        // Add the student to the database using StudentDAO
        StudentDAO.saveStudent(student);
        
        // Redirect to a page indicating successful addition of the student
        response.sendRedirect("StudentsList.jsp?message=success");
    }
    
    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String enrollmentDate = request.getParameter("enrollment_date");
        String major = request.getParameter("major");

        // Validate inputs
        if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || email == null || email.isEmpty() ||
                phoneNumber == null || phoneNumber.isEmpty() || enrollmentDate == null || enrollmentDate.isEmpty() ||
                major == null || major.isEmpty()) {
            response.sendRedirect("EditStudent.jsp?studentId=" + studentId + "&message=error&error=Invalid input");
            return;
        }

        Student student = StudentDAO.getStudentById(studentId);
        if (student == null) {
            response.sendRedirect("EditStudent.jsp?studentId=" + studentId + "&message=error&error=Student not found");
            return;
        }

        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setEmail(email);
        student.setPhoneNumber(phoneNumber);
        student.setEnrollmentDate(enrollmentDate);
        student.setMajor(major);

        try {
            boolean updated = StudentDAO.updateStudent(student);
            redirectAfterOperation(response, updated, "StudentsList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditStudent.jsp?studentId=" + studentId + "&message=error&error=An unexpected error occurred");
        }
    }
    
    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        try {
            // Call the delete method in your DAO to delete the student
        	StudentDAO.deleteStudent(studentId);
            response.sendRedirect("StudentsList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("StudentsList.jsp?message=error");
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
