<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>外显子查询结果</title>
</head>
<body>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String url="jdbc:mysql://localhost:3306/exon";
		String user="root";
		String pwd="149109";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pwd);
		stmt = conn.createStatement();
			
		String sql = "select transcript_id, exon_id, start, end, rank "
				+ "from exon55 join exon_transcript55 using (exon_id) "
				+ "where transcript_id =" 
				+ request.getParameter("transid");
		rs = stmt.executeQuery(sql);

		if (!rs.isBeforeFirst()){
			%>
			<p> There are no records for this ID!! </p>
		<%}			
		else {%>
			<table border="1">
			<tr>
			<td>transcript_id</td> <td> start</td> <td>end</td> <td>rank</td>
			</tr>
			<%while (rs.next()){%>
			<tr>
			<td>	<%= rs.getString("transcript_id")%> </td>
			<td>	<%= rs.getString("start")%> </td>
			<td>	<%= rs.getString("end")%> </td>
			<td>	<%= rs.getString("rank")%> </td>
			</tr>
			<%}%>
			</table>
		<%}%>
			
		<% if(rs!=null){
			rs.close();
		}
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}			
		 %>	
</body>
</html>