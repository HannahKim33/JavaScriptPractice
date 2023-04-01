<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="60%">
	<%
		try{
			String sql = "select * from dept order by dno";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.150:1521:XE", "c##madang", "madang");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				%>
					<tr>
						<td><%= rs.getInt(1) %> </td>
						<td><%= rs.getString(2) %> </td>
						<td><%= rs.getString(3) %> </td>
						<td><a href="deleteDept.jsp?dno=<%=rs.getInt(1)%>">삭제</a> </td>
					</tr>
				<%
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}
	%>
	</table>
</body>
</html>















