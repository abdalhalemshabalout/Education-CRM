package web;

import Dao.TeacherDAO;
import model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addTeacher(request, response);
                break;
            case "delete":
            	deleteTeacher(request, response);
                break;
            case "edit":
            	editTeacher(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve teacher details from the request parameters
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String hireDate = request.getParameter("hire_date");
        String department = request.getParameter("department");
        BigDecimal salary = new BigDecimal(request.getParameter("salary"));

        // Create a new Teacher object with the retrieved details
        Teacher teacher = new Teacher();
        teacher.setFirstName(firstName);
        teacher.setLastName(lastName);
        teacher.setEmail(email);
        teacher.setPhoneNumber(phoneNumber);
        teacher.setHireDate(hireDate);
        teacher.setDepartment(department);
        teacher.setSalary(salary);

        
        // Add the teacher to the database using TeacherDAO
        TeacherDAO.saveTeacher(teacher);
        
        // Redirect to a page indicating successful addition of the teacher
        response.sendRedirect("TeachersList.jsp?message=success");
    }
    
    private void editTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String hireDate = request.getParameter("hire_date");
        String department = request.getParameter("department");
        BigDecimal salary = new BigDecimal(request.getParameter("salary"));

        // Validate inputs
        if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || email == null || email.isEmpty() ||
                phoneNumber == null || phoneNumber.isEmpty() || hireDate == null || hireDate.isEmpty() ||
                department == null || department.isEmpty()) {
            response.sendRedirect("EditTeacher.jsp?teacherId=" + teacherId + "&message=error&error=Invalid input");
            return;
        }

        Teacher teacher = TeacherDAO.getTeacherById(teacherId);
        if (teacher == null) {
            response.sendRedirect("EditTeacher.jsp?teacherId=" + teacherId + "&message=error&error=Teacher not found");
            return;
        }

        teacher.setFirstName(firstName);
        teacher.setLastName(lastName);
        teacher.setEmail(email);
        teacher.setPhoneNumber(phoneNumber);
        teacher.setHireDate(hireDate);
        teacher.setDepartment(department);
        teacher.setSalary(salary);

        try {
            boolean updated = TeacherDAO.updateTeacher(teacher);
            redirectAfterOperation(response, updated, "TeachersList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditTeacher.jsp?teacherId=" + teacherId + "&message=error&error=An unexpected error occurred");
        }
    }


    private void deleteTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        try {
            // Call the delete method in your DAO to delete the teacher
        	TeacherDAO.deleteTeacher(teacherId);
            response.sendRedirect("TeachersList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("TeachersList.jsp?message=error");
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
