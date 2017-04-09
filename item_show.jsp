<%@page import="dao.CategoryDAO"%>
<%@page import="Bean.Category"%>
<%@page import="Bean.InventoryItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book-Show</title>
       <!--   <link rel="stylesheet" type="text/css" href="main.css">-->
    </head>
    <body>
    <% 
        InventoryItem item = (InventoryItem) request.getAttribute("item");
    %>
    <h2>Book-Details</h2>
    <table class="gridtable">
        <tr><td>Item Code</td><td><%=item.getCode() %></td></tr>
        <tr><td>Item Name</td><td><%=item.getDescription() %></td></tr>
        <tr><td>Price</td><td><%=item.getCost() %></td></tr>
        <tr><td>Quantity</td><td><%=item.getStock() %></td></tr>
       <% CategoryDAO catdao=new CategoryDAO(); 
       Category category=catdao.getcategory(item.getCateId());
       %>
        <tr><td>Category</td>
       <td><%= category.getCategory() %></td>
    
    </table>
    </form>
    </body>
</html>
