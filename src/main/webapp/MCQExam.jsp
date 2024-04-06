<%--
  Created by IntelliJ IDEA.
  User: Office
  Date: 4/5/2024
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*" %>
<html>
<head>
    <title>JSP Assignment For Exam </title>
</head>
<body>
<h2>Exam Questions</h2>
<form action="submitExam.jsp" method="post">
    <%
        try {
            // Parse XML file
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(application.getRealPath("/assignment.xml"));
            NodeList questions = doc.getElementsByTagName("question");
            NodeList answers = doc.getElementsByTagName("answer");
            for (int i = 1; i < questions.getLength(); i++) {
                out.println("<form method='post'>");
                out.println("<p>"+ i +"."   + questions.item(i).getTextContent() + "</p>");
                out.println("<input type='radio' name='q" + i + "' value='true'>True");
                out.println("<input type='radio' name='q" + i + "' value='false'>False");
                out.println("<br>");
            }
    %>

    <input type="submit" value="Submit">

    <%
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</form>
</body>
</html>
