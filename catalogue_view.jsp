<%@page import="Bean.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="Bean.InventoryItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" type="text/css" href="main.css">
        <title>Books in Stock</title>
    </head>
    <body>
        <h3>Books in Stock</h3>
        <a href="<%= application.getContextPath() %>/Controller?action=newitem"> Add New Item </a>
        <table class="gridtable">
            <tr><th class="gridtable">Item Code</th><th>Item Name</th><th>Qty</th><th>Price</th><th>category</th><th></th><th></th></tr>
        <%
        try{
            InventoryItem[] items =(InventoryItem[]) request.getAttribute("items");
           CategoryDAO catdao=new CategoryDAO();
                for(int i=0;i<items.length;i++) { 
                    int itmCode = items[i].getCode();
            %>
            <tr>
                <td><a href="<%= application.getContextPath() %>/Controller?action=showitem&itmCode=<%= itmCode %>"><%= itmCode %></a></td>
                <td><%= items[i].getDescription() %></td>
                <td><%= items[i].getStock() %></td>
                <td><%= items[i].getCost() %></td>
                <%
               
                Category category=catdao.getcategory(items[i].getCateId());
                %>
                <td><%= category.getCategory() %></td>
                <td><a href="<%= application.getContextPath() %>/Controller?action=edititem&itmCode=<%= itmCode %>">Edit</a></td>
                <td><a href="<%=application.getContextPath() %>/Controller?action=remove&itmCode=<%= itmCode %>">Remove</a></td>
            </tr>                
            <%}
        }catch(NullPointerException e){
            out.println("<tr><td colspan=\"6\">No Items Found</td></tr>");	
        }
        %>
        <a href="<%= application.getContextPath() %>/Controller?action=understockall">Items UnderStock</a>
        </table>
    </body>
</html>
