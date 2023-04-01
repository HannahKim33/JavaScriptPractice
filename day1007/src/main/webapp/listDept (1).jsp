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
	try{
		String sql="select * from dept order by dno";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.36:1521:XE","c##madang","madang");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><a href="deleteDept.jsp?dno=<%=rs.getInt(1)%>">삭제</a></td> <!--공백 있음 안됨-->
				</tr>
			<%
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println("예외발생: "+e.getMessage());
	}	
%>
<h2>입력정보는 다음과 같습니다.</h2>
아이디 : <%= id %><br>
암호 : <%= pwd %><br>
이름 : <%= name %><br>
나이 : <%= age %><br>
이메일 : <%= email %><br>
전화 : <%= phone %><br>
<hr>
</body>
</html>








