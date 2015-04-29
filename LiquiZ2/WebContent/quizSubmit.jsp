<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.io.*, java.util.*, org.adastraeducation.liquiz.*, org.adastraeducation.liquiz.database.*' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Quiz Submitted!</title>
</head>
<body>
<h1>LiquiZ</h1>

<div class='quiz'> <!-- temporarily called quiz for styling purposes -->
<% 
	int quizID = Integer.parseInt(request.getParameter("quizID"));
	Enumeration<String> quesIDs = request.getParameterNames();
	double score = 0;
	int total = 0;
	String lang = null; // the programming language used in code question 
	// TODO: if multiple code questions?
	int percent = 0;

	while (quesIDs.hasMoreElements()) {
		String id = quesIDs.nextElement();
		if(id.equals("quizID")) {
			total = Score.getTotalPoints(Integer.parseInt(request.getParameter(id)));
		} else if (id.equals("selectLang")) {
			lang = request.getParameter(id);
		}
		else {
			String[] res = request.getParameterValues(id);
			score += Score.correctQues(Integer.parseInt(id), res);
		}
	}
	
	percent = (int) Math.floor(score / (double) total * 100);
	
%>

<div class="quesHeader">
Your quiz (ID <%= request.getParameter("quizID") %>) has been submitted.
</div>

<div class="question">
Your score for this quiz is <%= score %> out of <%= total %> possible points, which is <%= percent %>%.

<% if (Score.needsGrading(quizID)) { %>
<br>However, this quiz includes questions that must be manually graded. Check back later to see your updated grade.
<%} else {%>
<br>This score is final. All questions have been automatically graded. 
<% } %> 
</div>

<% if (Database.getQuiz(quizID).getPolicy().getShowAns()) { %>
<!-- show quiz with given answers & correct answers -->
<% } else { %>
<!-- show quiz with given answers -->
<% } %>

</div>
</body>
</html>