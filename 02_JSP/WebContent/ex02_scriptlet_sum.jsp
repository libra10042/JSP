<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계구하기</title>
</head>
<body>
	<h2>1부터 10까지의 합계 구하기</h2>
	<h3>출력형태 : 1+2+3+....+9+10=55</h3>
	<h3>1+2+3+....+9+10=
	<%
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum += i;
	}
	out.print(sum);
	%>
	</h3>
	<hr>
	<%-- 스크립트릿, out객체를 사용해서 h3태그에 출력 
	<h3>출력형태 : 1+2+3+....+9+10=55</h3>
	<h3>1+2+3+4+5+6+7+8+9+10=55</h3>
	--%>
	<hr>
	
	<h1>
	<%
	//(실습) 반복문사용 1+2+3+4+5+6+7+8+9+10=55 브라우저에 표시 
	//out.print("<h3>1+2+3+4+5+6+7+8+9+10=55</h3>"); 
	//out.print("<h3>1+2+3+4+5+6+7+8+9+10=" + sum + "</h3>");
	sum = 0;
	int first = 1;
	int last = 10;
	int step = 1;
	for (int i = first; i <= last; i += step) {
		if (i == first) {
			out.print(i);
		} else { 
			out.print("+" + i);
		}
		sum += i;
	}
	out.print("=" + sum);
	%>
	</h1>
</body>
</html>












