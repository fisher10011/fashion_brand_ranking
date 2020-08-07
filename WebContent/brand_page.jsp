<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
	<%@ page import="brand.Brand"%>
	<%@ page import="brand.BrandDAO"%>
	<%@ page import="brand.get_datas"%>
	<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<%
	Brand brandObj = new Brand();
	BrandDAO brand = new BrandDAO();
	brandObj.Brandname = request.getParameter("Brandname");
	brandObj.link = request.getParameter("link");
	brandObj.brand_rank = Integer.parseInt(request.getParameter("brand_rank"));
	brandObj.brand_image = request.getParameter("image");
	
	get_datas image =new get_datas();
	image.update_url(request.getParameter("link"));
	image.get_data();
	brand.follwer_update(image.follwer, request.getParameter("link"));
%>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./css/bootstrap.css" />
    <link rel="stylesheet" href="./css/main.css" />
    <title><%= brandObj.Brandname %></title>
</head>
<body>
    <div class="header">
      <div class="container clearfix">
        <div class="container-left clearfix">
          <div class="logo">
            <a href="main.jsp">
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
    <br />

    <div class="container">
      <div class="leftrow">
        <img
        style="width: 181px"
          src="<%= brandObj.brand_image %>"
        />
        <div style="font-weight: bold;">브랜드명: <%= brandObj.Brandname %></div>
        <br />
        <div style="font-weight: bold;">공식 인스타그램 계정</div>
        <a href="https://www.instagram.com/<%= brandObj.link %>/" style="color: blue;"><p>https://www.instagram.com/<%= brandObj.link %>/</p></a>
      </div>
      <div class="rightrow">
        <table class="ranks" border="1">
          <thead>
            <tr>
              <th>순위</th>
              <th>팔로워 수 </th>
            </tr>
          </thead>
          <tr>
            <th><p style="font-size: 60px;"><%= brandObj.brand_rank %></p></th>
            <th><p style="font-size: 60px;"><%= String.format("%,d",image.follwer) %></p></th>
          </tr>
        </table>
      </div>
    </div>


    <div class="container container_instagram">
    <%
    	for(int i=0;i<12;i++){
    %>
      <div class="item">
      	<a href="https://www.instagram.com<%= image.links[i] %>">
        <img class="instagram_img" style="padding: 5px;" src="<%=image.images[i] %>" />
        </a>
        <table border="1" class="tags">
          <tr>
            <td>게시글 날짜</td>
          <td><%=image.image_date[i] %></td>
          </tr>
          <tr>
          <td>태그</td>
            <td><%=image.taggs[i] %></td>
          </tr>
        </table>
      </div>
      <%} %>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
  </body>
</html>