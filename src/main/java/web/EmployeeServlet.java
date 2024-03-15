package web;

import Dao.EmployeeDAO;
import model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
            	addEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            default:
                response.sendRedirect("ErrorPage.jsp");
                break;
        }
    }
    
    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String hireDate = request.getParameter("hire_date");
        String department = request.getParameter("department");
        BigDecimal salary = new BigDecimal(request.getParameter("salary"));

        Employee employee = new Employee();
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setEmail(email);
        employee.setPhoneNumber(phoneNumber);
        employee.setHireDate(hireDate);
        employee.setDepartment(department);
        employee.setSalary(salary);

        try {
            EmployeeDAO.saveEmployee(employee);
            response.sendRedirect("EmployeesList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddEmployee.jsp?message=error");
        }
    }
    
    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
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
            response.sendRedirect("EditEmployee.jsp?employeeId=" + employeeId + "&message=error&error=Invalid input");
            return;
        }

        Employee employee = EmployeeDAO.getEmployeeById(employeeId);
        if (employee == null) {
            response.sendRedirect("EditEmployee.jsp?employeeId=" + employeeId + "&message=error&error=Employee not found");
            return;
        }

        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setEmail(email);
        employee.setPhoneNumber(phoneNumber);
        employee.setHireDate(hireDate);
        employee.setDepartment(department);
        employee.setSalary(salary);

        try {
            boolean updated = EmployeeDAO.updateEmployee(employee);
            redirectAfterOperation(response, updated, "EmployeesList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditEmployee.jsp?employeeId=" + employeeId + "&message=error&error=An unexpected error occurred");
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        try {
            // Call the delete method in your DAO to delete the employee
            EmployeeDAO.deleteEmployee(employeeId);
            response.sendRedirect("EmployeesList.jsp?message=success&loadContent=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EmployeesList.jsp?message=error");
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
