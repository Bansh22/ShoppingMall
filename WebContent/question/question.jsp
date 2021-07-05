<%@page import="com.question.db.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login V10</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/util.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
<!--===============================================================================================-->



    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Violet | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">



	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->



</head>
<body>



	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row mt-5">
			<div class="col-2"></div>
			<div class="col-8 text-center">
				<div><h3>나의 피부타입은?!</h3></div>
				<div>(아니다 0점, ~ 그렇다 4점)</div>
			</div>
			<div class="col-2 mt-3">
				<c:if test="${userId eq 'admin' }">
					<button type="button" class="btn btn-secondary" id="write">글쓰기</button>
					<button type="button" class="btn btn-secondary" id="setting">⚙</button>
				</c:if>
			</div>
		</div>
		
		<div class="row m-5">
			<div class="col-2">
			</div>
			<div class="col-8 text-center">	
				
				
				<br>
				
				<%
				
				 List queQueList = (List)request.getAttribute("queQueList");
				int cnt = (int)request.getAttribute("cnt");
				
				int sum = 0;
				
				QuestionDTO qdto = null;
				
				for(int i=0; i < queQueList.size() ; i++){
				qdto = (QuestionDTO) queQueList.get(i);
				%>
				
				<div><%=qdto.getQnum()%>. <%=qdto.getQsub() %></div>
				<div class="mt-3">
				<h5>아니다&nbsp;
				
					<%for(int j=0; j < 5; j++){%>
					<input type="radio" name="<%=qdto.getQnum() %>" value="<%=j %>" id="radio">
					 <%} %>
					 
				&nbsp;그렇다</h5>
				
				</div>
				
				<c:if test="${userId eq 'admin' }">
				<button type="button" class="btn btn-primary btn-sm" onclick="location.href='./QueRevise.que?Qnum=<%=qdto.getQnum() %>'"> 수정 </button>
				 / 
				 <button type="button" class="btn btn-danger btn-sm" onclick="location.href='./QueDelete.que?Qnum=<%=qdto.getQnum() %>'">삭제</button>
				</c:if>
				
				
				<hr>
				
				<%} %>
				
				
			</div>
			<div class="col-2">	
			</div>
			
		</div>
		
		<div class="row m-4">
				<div class="col-5"></div>
				<div class="col-2">
				
				
				<!-- 다음으로 버튼 시작 -->
					
				<%
				
				int pageSize = 5;
				
				String pageNum = request.getParameter("pageNum");
				
				if(pageNum == null){
					pageNum = "1";
				}
				
				// 페이지별 시작 행 계산하기
				// 1p -> 1번 글부터, 2p -> 11번 글부터 3p -> 21번 글 부터 ... -> 일반화
				int currentPage = Integer.parseInt(pageNum);
				///////////////////////////////////////////////////
				// 페이징 처리 - 하단부 링크
				if(cnt != 0){
					// 글이 있을 때 표시
					// 전체 페이지 수 계산
					// ex) 50개 -> 한 페이지당 10개씩 출력, 필요한 페이지 개수 = 5개
					//     57개 -> 필요한 페이지 개수 = 6개
					
					int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
					
					// 한 화면에 보여줄 페이지 번호의 개수 (페이지 블록)
					int pageBlock = 3;
					
					// 페이지 블록의 시작페이지 번호
					// ex) 1~5페이지 : 1~10 페이지 : 1, 11~20페이지 : 11
					int startPage = ((currentPage-1)/pageBlock) * pageBlock +1;
					
					// 페이지 블록의 끝 페이지 번호
					int endPage = startPage+pageBlock-1;
					
					
					%>
					    
					    <%if(currentPage < endPage){ %>
					    <form action="./Question.que?pageNum=<%=currentPage + 1%>" method="post" >
					    	<input class="login100-form-btn" type="submit" value="다음으로" id="submit" onclick="return check()"> 
					    </form>
					    
					     <%}else{ %>
						<form action="./QuestionConfirm.que" method="post">
					    	<input class="login100-form-btn" type="submit" value="제출하기" id="submit" onclick="return check()"> 
					    	<input type="hidden" value="" name="sum" id="sum">
					    </form>					     
					     
					     <%} %>
					    <%
				}
			%>
				</div>
				<div class="col-5"></div>
			</div>
	</div>
	<!-- container 끝 -->	
	
	
	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->



	<script type="text/javascript">
		var sum = 0;

		// 라디오 버튼 눌렸을 때 값 누적하는 제이쿼리 시작
		$(document).ready(function () {
			
			if(<%=currentPage%> > 1){
				sum = sessionStorage.getItem("sum");
			}
			
			$("input:radio[id='radio']").click(function(){
				        
				var fnum = $(this).attr('value');
				
				sum = Number(sum) + Number(fnum);
				
		        // alert("개별 번호는 " + fnum);
		        
		        // alert(" 점수 합계는 " + sum);
		        
 		        sessionStorage.setItem("sum", sum);
		        
 		       // alert("세션에 저장된 값은 "+sessionStorage.getItem("sum"));
 		        
		        $('#sum').val(sessionStorage.getItem("sum"));
		        
			 });
			
		});
		// 라디오 버튼 눌렀을 때 값 누적하는 제이쿼리 끝
		
		
		// 글쓰기 버튼 시작
    	$('#write').click(function() {
    		location.href='./QueWrite.que';
		});    	
    	// 글쓰기 버튼 끝

    	// 세팅 버튼 시작
    	$('#setting').click(function() {
    		location.href='./QueSetting.que';
		}); 
    	// 세팅 버튼 끝    	
    	
    	// 라디오버튼 유효성 체크 시작
		function check() {

    		var frm = document.all;
    		
    		var radio_num = document.all.radio.length;
    		var chk_i = 0;
    		
    		for(var i = 0; i<radio_num; i++){
    			if(frm.radio[i].checked == true){
    				chk_i++;
    			}
    		}
    		
    		if(chk_i <= 4){
    			alert("모든 질문에 답해주세요");
    			return false;    			
    		}

    	}
    	// 라디오버튼 유효성 체크 끝

    	
	</script>

	
</body>
</html>