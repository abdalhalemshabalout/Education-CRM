package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnect.getConn();
            ps = con.prepareStatement("SELECT email FROM tb_users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            } else {
                out.println("<script>");
                out.println("alert('Login Failed!');");
                out.println("window.location.href = 'login.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>");
            out.println("alert('Error connecting to database!');");
            out.println("window.location.href = 'login.jsp';");
            out.println("</script>");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
