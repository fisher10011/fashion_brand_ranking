<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
    <%@ page import="java.io.PrintWriter"%>
	<%@ page import="brand.Brand"%>
	<%@ page import="brand.BrandDAO"%>
	<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
	Brand brandObj = new Brand();
	brandObj.setBrandname(request.getParameter("Brandname"));
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="./css/main.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<% 
	BrandDAO BrandDAO = new BrandDAO();
	int result = BrandDAO.delete(brandObj.Brandname);
	if (result == -1) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('브랜드 삭제 실패')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='search_engine.jsp'");
		//script.println("history.back()");
		script.println("</script>");

	}
	%>
	
</body>
</html>