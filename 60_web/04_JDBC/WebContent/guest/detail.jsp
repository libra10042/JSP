<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전달받은 사번으로 DB에서 조회해서 가져온 데이터 화면 표시 -->
<%
	//1. 파라미터값 추출
	String idx = request.getParameter("idx");
	
	//2. DB데이터 조회(idx : 사번)
	final String DRIVER = "oracle.jdbc.OracleDriver"; 
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; 
	final String USER = "mystudy"; 
	final String PASSWORD = "mystudypw"; 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	int sabun = 0;
	String name = "";
	Date nalja = null;
	int pay = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = "";
		sql += "SELECT SABUN, NAME, NALJA, PAY ";
		sql += "  FROM GUEST ";
		sql += " WHERE SABUN = ? ";
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(idx));
		//4. 쿼리실행
		rs = pstmt.executeQuery();	
		//5. 쿼리실행 결과에 대한 처리
		if (rs.next()) {
			sabun = rs.getInt("SABUN");
			name = rs.getString("NAME");
			nalja = rs.getDate("NALJA");
			pay = rs.getInt("PAY");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//3. 조회된 DB데이터 화면에 표시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<h1>[ <%=name %> ] 상세정보</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=nalja %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<a href="editForm.jsp?idx=<%=sabun %>&name=<%=URLEncoder.encode(name,"UTF-8") %>&pay=<%=pay %>">수정</a>
	<a href="delete.jsp?idx=<%=sabun %>">삭제</a>
</body>
</html>












