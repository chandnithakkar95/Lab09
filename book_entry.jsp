<%@page import="util.DAOException"%>
<%@page import="Bean.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="Bean.InventoryItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book-Entry</title>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
    <% 
        String update_action = (String) request.getAttribute("update_action");
        InventoryItem item;
	String heading = "";
	String caption = "";
        if ( update_action.equalsIgnoreCase("insert")) {
            item = new InventoryItem();
            heading = "New Item";
            caption = "Add Item";
	}
        else {
            item = (InventoryItem) request.getAttribute("item");
            heading = "Item - Edit";
            caption = "Update";
	}
    %>
    <h2><%= heading %></h2>
    <form method = "post" action="Controller">
    <input type="hidden" name="action" value="<%= update_action %>" />
    <table class="gridtable">
        <tr><td>Item Code</td><td><input type="text" name="item_code" value="<%= item.getCode() %>" /></td></tr>
        <tr><td>Name</td><td><input type="text" name="name" value="<%= item.getDescription() %>" /></td></tr>
        <tr><td>Cost</td><td><input type="text" name="price" value="<%= item.getCost() %>" /></td></tr>
        <tr><td>Minimum Quantity</td><td><input type="text" name="min_qty" value="<%= item.getMinStock() %>" /></td></tr>
        <tr><td>Available QUantity</td><td><input type="text" name="qty" value="<%= item.getStock() %>" /></td></tr>
        <tr><td>Category</td><td><select name="cate_id">
        <% CategoryDAO cDAO=new CategoryDAO();
        Category[] cats=null;	
        try{
        	cats=cDAO.getCategories();
        	System.out.println(cats.length);
        	}
        	catch(Exception e){
        		e.printStackTrace();
        	}
        	for(int i=0;i<cats.length;i++){
        %>
        <option value="<%=cats[i].getCatId()%>"><%=cats[i].getCategory() %></option>
        <%} %>
        </select></td></tr>
	
        <tr><td></td><td><input type="submit" value="<%=caption %>" /></td></tr>
    </table>
    </form>
    </body>
</html>
