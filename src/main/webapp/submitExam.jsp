<%--
  Created by IntelliJ IDEA.
  User: Office
  Date: 4/5/2024
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*" %>
<html>
<head>
    <title>Exam Scores</title>
</head>
<body>
<h1>Exam Scores </h1>
<h2>Your Scores </h2>
<%
    try {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(application.getRealPath("/assignment.xml"));
        NodeList questions = doc.getElementsByTagName("question");
        NodeList answers = doc.getElementsByTagName("answer");

        // Initialize score
        int score = 0;

        // Check user's answers
        for (int i = 0; i < questions.getLength(); i++) {
            String userAnswer = request.getParameter("q" + i);
            String correctAnswer = answers.item(i).getTextContent();
            if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                score++;
            }
        }
        out.println("<p>Your score: " + score + "/" + questions.getLength() + "</p>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
    <a href="index.jsp">Try Again</a>
</body>
</html>
