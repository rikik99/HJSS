<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
   crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
   crossorigin="anonymous"></script>
<style>
.sticky-footer {
   bottom: 0;
   width: 100%;
   height : 70px;
}

h2,h3{
   text-align:center;
   margin-top : 5%;
}
td{
  padding : 3%;
  width :50%;
}
p{
  margin : 5%;
  }
 textarea{
       width:100%;
       height :100%;
       border: none;
 }
.collapsible {
            background-color: #f1f1f1;
            color: black;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: solid 1px #E7E7E7;
            text-align: left;
            outline: none;
            font-size: 15px;
}
 .active,
.collapsible:hover {
            background-color: #D1E2FF;
}
.content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: white;
            border : solid 1px #E7E7E7;
}
.collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
 }
.active:after {
            content: "\2212";
}
</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp"%>
   <main class="container-fluid">
      <div class="row">
         <nav class="col-2 bg-white sidebar vh-100 border-end">
            <div class="sidebar-sticky pt-3">
               <%@include file="/WEB-INF/include/main_nav.jsp"%>
            </div>
         </nav>
            <section class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <h2 style="height:50px;">자주 묻는 질문</h2>
            <table>
                  <tr><td>            
                  <h3>개인회원 FAQ</h3>
                  <c:forEach var="faq"  items="${faqList}">            
                      <button type="button" class="collapsible" onclick="collapse(this);">${faq.question}</button>
                         <div class="content">
                          <p>${faq.answer}</p>
                      </div>
                      </c:forEach>
                      </td>
                      <td>
                  <h3>기업회원 FAQ</h3>
                  <c:forEach var="faq"  items="${faqList2}">            
                      <button type="button" class="collapsible" onclick="collapse(this);">${faq.question}</button>
                         <div class="content">
                          <p>${faq.answer}</p>
                         </div>
                      </c:forEach>
                      </td></tr>
                </table>
                </section>
                </div>
             </main>

   <%@include file="/WEB-INF/include/getstatus.jsp" %>
   <%@include file="/WEB-INF/include/footer.jsp"%>
   
   <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>
</body>
</html>