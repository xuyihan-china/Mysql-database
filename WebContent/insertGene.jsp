<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>插入结果</title>
</head>
<body>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		String url="jdbc:mysql://localhost:3306/exon";
		String user="root";
		String pwd="149109";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pwd);
			
		String sql = "INSERT INTO `gene55` (`gene_id`,`start`,`end`,`biotype`) VALUES (?,?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, request.getParameter("gene_id"));
		stmt.setString(2, request.getParameter("start"));
		stmt.setString(3, request.getParameter("end"));
		stmt.setString(4, request.getParameter("biotype"));
		
		int flag = stmt.executeUpdate();

		if (flag != 0){
			%>
			<p> insert success! </p>
		<%}			
		else {%>
			<p> insert failed! </p>
		<%}%>
			
		<%
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}			
		 %>	
</body>
</html>