
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int dno = Integer.parseInt(request.getParameter("dno"));
	String sql = "delete dept where dno="+dno;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.150:1521:XE", "c##madang", "madang");
		Statement stmt = conn.createStatement();
		int re=stmt.executeUpdate(sql);
		if(re == 1){
			%>
				해당부서를 삭제하였습니다.
			<%
		}else{
			%>
				부서삭제에 실패하였습니다.
			<%
		}
		
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println("예외발생:"+e.getMessage());
	}
%>

</body>
</html>