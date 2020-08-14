<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
    <%@ page import="java.io.PrintWriter"%>
	<%@ page import="brand.Brand"%>
	<%@ page import="brand.BrandDAO"%>
	<%@ page import="brand.Number"%>
	<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
	int min = Integer.parseInt(request.getParameter("min"));
	int max = Integer.parseInt(request.getParameter("max"));
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
<title>순위</title>
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

    <div class="container">
      <div class="row">
        <div class="span12">
          <form
            id="custom-search-form"
            class="form-search form-horizontal pull-right"method="get" action="search_engine_after.jsp"
          >
            <div class="input-append">
              <input type="text" class="search" placeholder="Search" name="brand_name"/>
              <button type="submit" class="btn">
                <i class="fas fa-search fa-2x"></i>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="container_main">
      <form action="" style="padding-left: 20px;">
        <table class="plus_action">
          <tr>
            <td >팔로워 수  <input type="number" style="width:70px"/> 이상 &nbsp;&nbsp;&nbsp;<input type="number" style="width:70px" /> 이하</td>
            <td>
              &nbsp;&nbsp;<input type="submit" value="조건 적용" />
            </td>
           </tr>
        </table>
      </form>
    </div>
    <br>
    <br>

    <div class="container">
          <table class="rank" border="1" style="border: black;">
            <thead class="head">
              <tr>
                <th style="width: 100px;">순위</th>
                <th>브랜드</th>
                <th style="width: 150px">팔로워 수</th>
              </tr>
            </thead>
            <tbody>
            	<%
            	BrandDAO brandDAO = new BrandDAO();
            	ArrayList<Brand> list = brandDAO.getlist_with_follwer(min,max);
            	Number num = new Number();
            	for(int i=0;i<list.size();i++){
            	%>
              <tr style="height:80px">
                <td><div style="padding-left: 42px"><%= (list.get(i).brand_rank) %></div></td>
                <td><a href="brand_page.jsp?Brandname=<%= list.get(i).Brandname %>
                &link=<%= list.get(i).link %>&brand_index=<%= list.get(i).brand_index %>
                &brand_rank=<%= list.get(i).brand_rank %>&image=<%= list.get(i).brand_image %>&index=<%=list.get(i).brand_index %>">
                <img
		        style="width: 181px"
		          src="<%= list.get(i).brand_image %>"
		        />
                <%= list.get(i).Brandname %></a></td>
                <td><%=num.num_out(list.get(i).brand_follwer)%></td>
              </tr>
              <%} %>
            </tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3">순위 리스트</td>
				</tr>
			</tfoot>
          </table>
          <input type="button" value="브랜드 추가하기" onclick="location.href='brand_update.jsp';"/>
          <input type="button" value="브랜드 삭제하기" onclick="location.href='delete_brand.jsp';"/>
          <form method="post" action="rank_update_action.jsp">
          <input type="submit" value="순위 새로고침" >
          </form>
          <br>
          <br>
          <br>
          <br>
        </div>
</body>
</html>