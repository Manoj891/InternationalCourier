
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String token = request.getParameter("token");
    String path = request.getContextPath();
    try {
        if (token.length() < 100) {
            out.print("<script>window.location.assign('" + path + "');</script>");
        }
    } catch (Exception e) {
        out.print("<script>window.location.assign('" + path + "');</script>");
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome in MsWare</title>

</head>
<body>
<script>
    localStorage.setItem("IC-TOKEN","<%=token%>");
    window.location.assign("home")
</script>
</body>
</html>
