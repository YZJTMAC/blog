<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 li{
list-style-type: none;
display: inline;
 }
</style>
</head>
<body>
	${message}
	<form action="login.action" method="post">
		<p>
			Account: <input type="text" name="account" />
		</p>
		<p>
			Password: <input type="text" name="psw" />
		</p>
		<ul>
			<li><input type="submit" value="Submit"  id="submit"/></li>
			<li><a href="go_registered_account.action" target="_blank" id="registered">注册</a></li>
			<li><a href="go_find_psw.action" target="_blank" id="find">找回密码</a></li>
		</ul>
	</form>
</body>
</html>