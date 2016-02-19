<%@page import="com.hotel.member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hotel <decorator:title />
</title>
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
   });
</script>
<style type="text/css">
header {
   height: 86px;
   border: 1px solid #ccc;
   background: #3b312a;
   color: white;
}

footer {
   border: 1px solid #ccc;
   clear: both;
   text-align: center;
   font-size: 13px;
   height: auto;
   margin-bottom: 2px;
   background: #3b312a;
   color: #867a6f;
}

a {
   text-decoration: none !important;
}

section#menu {
   height: 53px;
   background: #3b312a;
}

img {
   cursor: pointer;
}

#label {
   color: orange;
   font-size: 14px;
}

#body {
   border: 1px solid #ccc;
   height: 740px;
   background: #3b312a;
   color: #867a6f;
}

#login {
   width: 250px;
   height: 86px;
}

#login1 {
   width: 600px;
   text-align: right;
   margin-top: 1px;
   background: black;
   height: 24px;
   text-align: right;
}

#login2 {
   margin-right: 100px;
   margin-top: 1px;
   text-align: right;
}

#text {
   font-size: 12px;
   color: white;
}

#menutext {
   color: white;
   font-size: 20px;
   margin-right: 20px;
}

#padding {
   width: 250px;
}

#menu2 {
   margin-right: 150px;
   background: #3b312a;
}
</style>
<decorator:head />
</head>
<body>
   <header>
      <div id="login">
         <a href="../main/index.do"><img src="../images/logo.png"
            height="130px" width="200px"></a>
      </div>
      <!-- section 안에 메뉴별 각각 폼 호출 -->
      <section id="menu">
         <div id="login1">
            <div id="login2">
               <%
                  // session의 member에 정보가 있으면 회원정보 및 logout 호출
                  if (session.getAttribute("login") != null) {
               %>
               <a href="../member/view.do?id=${login.id }" id="text">
                  ${login.name } </a> 님 [${login.grade }] 환영합니다. <a
                  href="../member/logout.do" id="text">LOGOUT </a>
               <%
                  // session의 member에 정보가 없으면 login과 join us 호출
                  } else {
               %>
               <a href="../member/login.do" id="text">LOGIN</a> | <a
                  href="../member/join.do" id="text">JOIN US </a><br />
               <%
                  }
               %>
            </div>
         </div>
         <section id="menu2">
            <br /> <a href="" id="menutext">호텔소개</a> <a href="" id="menutext">객실소개</a>
            <a href="" id="menutext">공지사항</a> <a href="" id="menutext">후기게시판</a>
            <a href="" id="menutext">Qna</a>
            <%
               // session의 member에 정보가 있으면 마이페이지 호출
               if (session.getAttribute("login") != null) {
            %>
            <a href="" id="menutext">마이페이지</a>
            <%
               }
            %>
         </section>
      </section>
   </header>
   <section id="body">
      <section>
         <decorator:body />
      </section>
   </section>
   <footer>
      <!-- footer 바닥글 구현 -->
      <br /> 상호명 (주)웅이 | 대표이사 혜연혜연열매 | 서울특별시 송파구 가락2동 행운빌딩2층 | 대표번호 :
      7979-8282 | 팩스 02-555-5000 <br />대표 이메일 : Ritght@common.com COPYRIGHT
      (C) 2016 BY TRACE 60DISH.ALL RIGHTS RESERVED.<br /> <br />
   </footer>
</body>
</html>