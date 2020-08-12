<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
    <%@ page import="java.io.PrintWriter"%>
	<%@ page import="brand.Brand"%>
	<%@ page import="brand.BrandDAO"%>
	<%@ page import="java.util.ArrayList"%>
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
<title>브랜드 삭제</title>
</head>
<body>

    <div class="header">
      <div class="container clearfix">
        <div class="container-left clearfix">
          <div class="logo">
            <a href="index.jsp">
            <img
              src="https://heropcode.github.io/GitHub-Responsive/img/logo.svg"
              alt="메인 메뉴"
            />
          </a>
          </div>
          <div class="menu clearfix">
            <a class="menu-item" href="search_engine.jsp">Brand Ranking</a>
          </div>
        </div>
      </div>
    </div>
    
    
		<form method="post" action="delete_brand_action.jsp" >
		<div align="center">
		<table summary="테이블 구성"">
		<caption>브랜드 삭제하기</caption>
    		<tr>
				<td>삭제하고싶은 브랜드 명</td>
				<td><input type=text name=Brandname size=10 maxlength=8></td>
			</tr>
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="브랜드 삭제" >&nbsp;&nbsp;
         		<input type="button" value="뒤로" onclick="move('search_engine.jsp');"></div>
     			</td>
    		</tr> 
		</table>
		</div>
	</form> 
    
    
</body>
</html>