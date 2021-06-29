<%@page import="java.util.ArrayList"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.like.db.LikeDTO"%>
<%@page import="com.like.db.LikeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<style type="text/css">

#cb {
 zoom : 1.5;
 

}
</style>
<script type="text/javascript">
	$('#allch')


</script>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	<%
		String userId = (String) session.getAttribute("userId");

		if (userId == null) {
			response.sendRedirect("../MemberLogin.me");
		}
		
		LikeDAO ldao = new LikeDAO();
		
		
		List LikeList = (List) request.getAttribute("LikeList");
		%>


	<!-- container 시작 -->


	<!-- Page Add Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>

		<div class="col-lg-9">
			<div class="page-breadcrumb">
				<h2>
					MY PAGE<span>.</span>
				</h2>
			</div>
		</div>


	</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="row">
					<div class="col-3">
						<a href=""><h5>장바구니</h5></a> <a href=""><h5>주문조회</h5></a> <a
							href="./getLike.li"><h5>찜목록</h5></a>
						<hr>
						<a href="./MyCoupon.me"><h5>내 쿠폰 / 포인트</h5></a>
						<hr>
						<a href=""><h5>내 화장품 사용기한 &nbsp;확인하기</h5></a>
						<hr>
						<a href="./MemberUpdateInfo.me"><h5>회원 정보 수정</h5></a> <a
							href="./MemberDelete.me"><h5>탈퇴하기</h5></a>
					</div>
					<div class="col-9">
						<h3>나의 찜목록 (총 <b style="color: orange;"><%=LikeList.size()%></b>개)</h3>
						<br>
						
						<table class="table">
							<tr>
								<th colspan="2">상품</th>
								<th>관리</th>
							</tr>

							 <%
							 if(LikeList.size() != 0){
								for (int i = 0; i < LikeList.size(); i++) {
									GoodsDTO gdto = (GoodsDTO) LikeList.get(i);
									
							%>
								<form action="./deleteLike.li" method="get">
							<tr>
								<input type="hidden" name="cosnum" value="<%=gdto.getCosNum()%>">
								<td><img src="<%=gdto.getCosImage()%>" width="150px" height="150px"></td>
								<td><b><%=gdto.getCosBrand() %></b><br>
								<%=gdto.getCosName() %>
								<h4><%=gdto.getCosPrice() %>원</h4></td>
								
								<td>
									<input type="image" src="./img/icons/heart.png" width="40px" style="margin-top: 80%" >
								</td>
								</form>
							</tr>
							<%
								}
							 }
							%> 
						</table>
					
					<!-- 페이징 처리 -->
								<div class="number_button" style="display: flex;">
					
					<div class="numbers"  style="font-size: 20px; text-align: left; width: 50%;">
						
						  <ul class="pagination">
								 
						    
						  </ul>
							
					</div>
				
		 			</div>
					
					
					<!-- 페이징 처리 -->
					
					
					
					
					
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>



	</div>
	<!-- Page Add Section Begin -->
	<section class="page-add"> </section>
	<!-- Page Add Section End -->

	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->




</body>
</html>