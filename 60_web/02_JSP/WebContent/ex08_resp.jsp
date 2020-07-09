<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//(실습)주문한 내역에 따라 계산하고 결과를 표시
	//1. 파라미터 값 추출
	//ex08_resp.jsp?coffee=1&su=2&money=10000
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	String menu = ""; //선택메뉴
	int dan = 0; //메뉴단가
	
	//선택메뉴, 단가 구하기
/*	
	if ("1".equals(coffee)) {
		//System.out.println(coffee + " : 아메리카노, 3000원");
		menu = "아메리카노";
		dan = 3000;
	} else if ("2".equals(coffee)) {
		menu = "카페모카";
		dan = 3500;
	} else if ("3".equals(coffee)) {
		menu = "에스프레소";
		dan = 2500;
	} else if ("4".equals(coffee)) {
		menu = "카페라떼";
		dan = 4000;
	}
*/
	switch(coffee) {
	case "1" : menu = "아메리카노"; dan = 3000; break;
	case "2" : menu = "카페모카"; dan = 3500; break;
	case "3" : menu = "에스프레소";	dan = 2500; break;
	case "4" : menu = "카페라떼"; dan = 4000; break;
	}
	
	//2. 계산처리(단가는 변수 또는 상수 처리)
	int total = dan * su; //구입총액 = 단가 * 수량
	int change = money - total; // 잔액 = 입금액 - 구입총액
	
	//3. 계산결과 화면 출력
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과</h2>
	<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가 * 수량)
	--------------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
	--%>
	<ul>
		<li>커피종류 : <%=menu %></li>
		<li>단가 : <%=dan %>원</li>
		<li>수량 : <%=su %></li>
		<li>구입금액 : <%=total %>원</li>
		<li>--------------------</li>
		<li>입금액 : <%=money %>원</li>
		<li>잔액 : <%=change %>원</li>
	</ul>
</body>
</html>







