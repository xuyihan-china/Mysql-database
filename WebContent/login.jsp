<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登录结果</title>
<style> @import url(login.css);</style>
</head>
<body>
	
<%
    String name=request.getParameter("name");
   	String password=request.getParameter("password");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url="jdbc:mysql://localhost:3306/mysql";
	String user="root";
	String pwd="149109";
		
 	Class.forName("com.mysql.jdbc.Driver");
 	conn=DriverManager.getConnection(url,user,pwd);
 	stmt = conn.createStatement();
			
	String sql = "select user from user where user = '"
	 		+ request.getParameter("name")
 			+ "' and password = password('" 
	 		+ request.getParameter("password")
	 		+"')";
	rs = stmt.executeQuery(sql);

	if (!rs.isBeforeFirst()){
%>

	<div class="login_result">
		<h1>用户名或密码错误！</h1>
		<a href="login.html"><button type="submit" class="btn btn-primary btn-block btn-large">返回登录界面</button></a>
	</div>
	
<%	
	} else {
		rs.next();
		rs.getString("user");

		if(name.equals("xiaowang"))	{
%>

	<div class="login_result">
		<h1>登陆成功</h1>
		<h1>欢迎<span>xiaowang</span>使用</h1>
		<h2>您可以查询exon数据库中的表，请<a href="visitExon.html">点击链接</a>查询转录本的外显子信息。</h2>
	</div>
	
<%
		} else if(name.equals("xiaomore")) {
%>

	<div class="login_result">
		<h1>登陆成功</h1>
		<h1>欢迎<span>xiaomore</span>使用</h1>
		<h2>您可以向exon数据库中的表插入数据，请<a href="insertGene.html">点击链接据</a>向Gene表中插入数。</h2>
	</div>
	  
<%
		} else {
%>
	<div class="login_result">
		<h1>登陆成功</h1>
		<h2>本查询/修改只支持xiaowang和xiaomore，请切换账号重新登录</h2>
		<a href="login.html"><button type="submit" class="btn btn-primary btn-block btn-large">返回登录界面</button></a>
	</div>
	
<%
		}
	}
%>

</body>
</html>