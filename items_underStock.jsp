<%@page import="Bean.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="Bean.InventoryItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% CategoryDAO catdao=new CategoryDAO(); 
	Category category[]=catdao.getCategories();
	%>
	<form method="post" action="Controller">
	<input type="hidden" name="action" value="understockcatgory"/>
	<select name="cateSelct"> 
		<option value="all">All</option>
		<% for(int i=0;i<category.length;i++){
		%> <option value="<%= category[i].getCatId() %>"><%=category[i].getCategory() %></option>
		<%}
		%>
	</select>
	<input type ="submit"  > 
	</form>
</body>
</html>