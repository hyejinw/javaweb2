<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<%
	String member2 = request.getParameter("member")==null? "": request.getParameter("member"); 
%>
<style>
	.hover:hover {
		color: #ffa0c5;
	}
</style>
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: rgba(253, 250, 247, 0.8)">
  <a class="navbar-brand" href="main.jsp?member=<%=member2 %>"><img src="knotted_logo.png" style="width: 90px; height: 50px;"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" style="background-color: #ffa0c5;">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav mr-auto">
    <% if(member2.equals("OK")) {%>
      <li class="nav-item">
        <a class="nav-link"  style="color: #282828" href="main.jsp?sw=reservation&member=<%=member2 %>" ><b class="hover">RESERVATION</b></a>
      </li>
    <% } %>
      <li class="nav-item">
        <a class="nav-link"  style="color: #282828" href="main.jsp?sw=menu&member=<%=member2 %>"><b class="hover">MENU</b></a>
      </li>
      <li class="nav-item">
	      <a class="nav-link"  style="color: #282828" href="main.jsp?sw=location&member=<%=member2 %>"><b class="hover">LOCATION</b></a>
      </li>    
      <li class="nav-item">
	      <a class="nav-link" style="color: #282828"  href="main.jsp?sw=brand&member=<%=member2 %>"><b class="hover">BRAND</b></a>
      </li>    
    </ul>
    <ul class="navbar-nav my-2 my-lg-0">
    <% if(member2.equals("OK")) {%>
      <li class="nav-item">
        <a class="nav-link hover" style="color: #282828" href="main.jsp?sw=logout" ><i class="fas fa-heart"></i><b class="text-success">${sMid}</b>님<i class="fas fa-heart"></i> 로그인 중 &nbsp;&nbsp;</a>
      </li>
      <li class="nav-item">
        <a class="nav-link hover" style="color: #282828" href="main.jsp?sw=logout" >LOGOUT</a>
      </li>
    <% } else {%>
      <li class="nav-item">
        <a class="nav-link hover" style="color: #282828" href="main.jsp?sw=login" >LOGIN</a>
<!--         <a class="nav-link hover"  style="color: #282828" href="main.jsp?sw=login&member=<%=member2 %>" >LOGIN</a> 이건 왜 안 될까?-->
      </li>
		<% } %>
      <li class="nav-item">
        <a class="nav-link hover" style="color: #282828" href="main.jsp?sw=mypage&member=<%=member2 %>">MY PAGE</a>
      </li>
      <li class="nav-item">
	      <a class="nav-link hover" style="color: #282828" href="main.jsp?sw=cart&member=<%=member2 %>">CART</a>
      </li>       
    </ul>
	</div>
</nav>