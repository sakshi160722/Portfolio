<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%


String email=request.getParameter("email");
String name=request.getParameter("name");
//String subject=request.getParameter("subject");
String message=request.getParameter("message");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fb","root","");
           PreparedStatement ps=con.prepareStatement("insert into feeddb(email,name,desc)values(?,?,?)");
           ps.setString(1, email);
           ps.setString(2, name);
//           ps.setString(3, subject);
           ps.setString(3, message);
           if(ps.executeUpdate()>0)
           {%>
                <script>
                     alert("Thanks");
                 </script>
                <%}

             
               
        } catch(Exception e)
        {
            System.out.println(e);
           %>
                <script>
                     alert("Something went wrong!Try Again!");
                 </script>
                <%
        }        
       
%>