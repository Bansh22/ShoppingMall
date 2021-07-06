<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
    <link rel="stylesheet" href="./css/N_style.css" type="text/css">
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function datecheck(){
	
	var startyear = $('#startyear').val();
	var endyear = $('#endyear').val();
	var startmonth = $('#startmonth').val();
	var endmonth = $('#endmonth').val();
	var startday = $('#startday').val();
	var endday = $('#endday').val();
	
	var startdate = startyear +"-"+ startmonth +"-"+ startday;
	var enddate = endyear + "-" + endmonth +"-"+ endday
	
	$('#startdate').val(startdate);
	$('#enddate').val(enddate);
	
	if(startdate > enddate){
		alert('검색 종료일을 검색 시작일 보다 늦은 날짜로 지정해주세요.');
		return false;
	}else if(endyear - startyear > 2){
		alert('최대 검색 가능 기간은 1년 입니다.');
		return false;
	}
	
}


</script>	
	<style type="text/css">
	#cp {
	color: orange;
	font-size: 25px;
	
	}
	</style>

</head>
<body>
	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	<%
	String userId = (String)session.getAttribute("userId");
  
    if(userId == null){
    	response.sendRedirect("../MemberLogin.me");
    } 
		List couponList = (List)request.getAttribute("couponList");
		List orderList = (List)request.getAttribute("orderList");
		List orderList2 = (List)request.getAttribute("orderList2");
	%>
		
	
	<!-- container 시작 -->	
	
	
	 <!-- Page Add Section Begin -->
    <section class="page-add">
            <div class="row">      
                <div class="col-lg-3"></div>
                  
                <div class="col-lg-9">
                    <div class="page-breadcrumb">
                        <h2>MY PAGE<span>.</span></h2>
                    </div>
                </div>
            
                
            </div>
    </section>
    <!-- Page Add Section End -->
	
	
	<div class="container-fluid">	
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">	
			<div class="row">
				<div class="col-3">
					<a href=""><h5>장바구니</h5></a>
					<a href=""><h5>주문조회</h5></a>
					<a href="./getLike.li"><h5>찜목록</h5></a>
					<hr>
					<a href="./MyCoupon.cp"><h5>내 쿠폰 / 포인트</h5></a>
					<hr>
					<a href=""><h5>내 화장품 사용기한 
					&nbsp;확인하기</h5></a>
					<hr>
					<a href="./MemberUpdateInfo.me"><h5>회원 정보 수정</h5></a>
					<a href="./MemberDelete.me"><h5>탈퇴하기</h5></a>
				</div>
				<div class="col-9">
				<h3>내 쿠폰</h3><br>
				<%
				int cnt = 0;
				for(int i=0;i<couponList.size();i++){ 
					CouponDTO cdto = (CouponDTO)couponList.get(i);
					cnt += cdto.getMcAmount();
					System.out.println(cnt);
								}%>
				<h4>총  <b id="cp"><%=cnt %></b> 장의 쿠폰이 있습니다.</h4><br>
								
								<table class="table table-striped" width="862px;">
									<tr>
										<th>쿠폰명</th>
										<th>할인율</th>
										<th>보유 수량</th>
									</tr>
									<%for(int i=0;i<couponList.size();i++){ 
									CouponDTO cdto = (CouponDTO)couponList.get(i);
									%>
									<tr>
										<td><%=cdto.getCouponName() %></td>
										<td><%=cdto.getCouponDc() %>%</td>
										<td><%=cdto.getMcAmount() %>장</td>
									
									</tr>
									<%} %>									
								
								</table>
				<br><br><br>
				<fieldset id="checkline">
					<br><br>
					<form action="pointcheck.cp" method="post" onsubmit="return datecheck()">
					<input type="hidden" id="startdate" name="startdate">
					<input type="hidden" id="enddate" name="enddate">
					<input type="button" value="1개월" class="btn btn-outline-info" onclick="location.href='pointcheck.cp?searchmonth=1';">				
					<input type="button" value="3개월" class="btn btn-outline-info" onclick="location.href='pointcheck.cp?searchmonth=3';">				
					<input type="button" value="6개월" class="btn btn-outline-info" onclick="location.href='pointcheck.cp?searchmonth=6';">	
					
					<br><br>
					
					<select name="startyear" id="startyear" class="custom-select" style="width: 100px;">
						<option name="2021">2021</option>
						<option name="2020">2020</option>
						<option name="2019">2019</option>
						<option name="2018">2018</option>
						<option name="2017">2017</option>
					</select>년&nbsp;&nbsp;
					
					<select name="startmonth" id="startmonth" class="custom-select" style="width: 100px;">
						<%for(int i=1;i<13;i++) {%>
						<option name="<%=i%>"><%=i %></option>
						<%} %>
					</select>월&nbsp;&nbsp;
					
					<select name="startday" id="startday" class="custom-select" style="width: 100px;">
						<%for(int i=1;i<32;i++) {%>
						<option name="<%=i%>"><%=i %></option>
						<%} %>
					</select>일
					
					<b class="wave">~</b>
					
						<select name="endyear" id="endyear" class="custom-select" style="width: 100px;">
						<option name="2021">2021</option>
						<option name="2020">2020</option>
						<option name="2019">2019</option>
						<option name="2018">2018</option>
						<option name="2017">2017</option>
					</select>년&nbsp;&nbsp;
					
					<select name="endmonth" id="endmonth" class="custom-select" style="width: 100px;">
						<%for(int i=1;i<13;i++) {%>
						<option name="<%=i%>"><%=i %></option>
						<%} %>
					</select>월&nbsp;&nbsp;
					
					<select name="endday" id="endday" class="custom-select" style="width: 100px;">
						<%for(int i=1;i<32;i++) {%>
						<option name="<%=i%>"><%=i %></option>
						<%} %>
					</select>일&nbsp;&nbsp;
					
				
					<input type="submit" value="조회하기" class="btn btn-info">
				
					</form>
					<br><br>
				</fieldset>
				
				
				
				<table class= "table table-bordered">
					<thead style="text-align: center;">
						<tr>
							<td>적립일자</td>						
							<td>내역</td>						
							<td>적립</td>						
							<td>사용</td>						
						</tr>
					</thead>
					<tbody>
						<%
						
						if(orderList2 != null){
						for(int j=0;j<orderList2.size();j++){
							OrderDTO odto2 = (OrderDTO)orderList2.get(j);%>
						<tr>
							<td><%=odto2.getOrderDate() %></td>
							<td><%=odto2.getO_cosName() %></td>
							<td><b id="add"><%=odto2.getAddPoint() %></b>P</td>
							<td><b id="sub"><%=odto2.getPtUseAmount()%></b>P</td>
						</tr>
					</tbody>
					
						<%} 
						}%>
					<!-- ----------------------------------------------------------- -->
					<tbody>
						<%if(orderList != null){
						for(int i=0;i<orderList.size();i++){
							OrderDTO odto = (OrderDTO)orderList.get(i);%>
						<tr>
							<td><%=odto.getOrderDate() %></td>
							<td><%=odto.getO_cosName() %></td>
							<td><b id="add"><%=odto.getAddPoint() %></b>P</td>
							<td><b id="sub"><%=odto.getPtUseAmount()%></b>P</td>
						</tr>
					</tbody>
						
						<!-- 1,3,6 개월 조회  -->
					<tbody>
					<%} 
						} else if(orderList == null && orderList2 == null){%>
						<tbody>
							<tr id="nopnt"><td colspan="4">
							<div id="nopnt-text">
							적립 / 사용한 포인트가 없습니다.
							</div>
							</td></tr>
						</tbody>
						<%} %>
				
				
				</table>
					<hr>
				
					
					
				</div><!--col-9  -->
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	
	
	
	</div>
	 <!-- Page Add Section Begin -->
    <section class="page-add">
    </section>
    <!-- Page Add Section End -->
	
	<!-- container 끝 -->	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
	

	
</body>
</html>