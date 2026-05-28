<%@ page import="com.ms.ware.online.solution.config.MyContext" %>
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
    session.setAttribute("bsdate",request.getParameter("bsdate"));
    session.setAttribute("fyStart",request.getParameter("fyStart"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome in MsWare</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="index, follow"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>Document/Organization/Logo.png">
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
<script>
    localStorage.setItem("token", "Bearer <%=token%>");
    const path = localStorage.getItem("context-path")
    const token = localStorage.getItem("token");

    function getRecord() {
        const URL = path + "/api/setup/login-init/organization";
        $.ajax({
            type: "POST",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.userType === "NOR") {
                    localStorage.setItem("menuUserAccess", data.menuUserAccess);
                }
                localStorage.setItem("userType", data.userType);
                localStorage.setItem("username", data.username);
                localStorage.setItem("organization-name", data.organizationName);
                localStorage.setItem("organization-tel", data.organizationTel);
                localStorage.setItem("organization-address", data.organizationAddress);
                localStorage.setItem("programMaster", JSON.stringify(data.programMaster));
                localStorage.setItem("classMaster", JSON.stringify(data.classMaster));
                localStorage.setItem("academicYear", JSON.stringify(data.academicYear));
                localStorage.setItem("subjectGroup", JSON.stringify(data.subjectGroup));
                localStorage.setItem("fiscalYear", JSON.stringify(data.fiscalYear));
                localStorage.setItem("billMaster", JSON.stringify(data.billMaster));
                localStorage.setItem("sundryCreditors", JSON.stringify(data.sundryCreditors));
                localStorage.setItem("section", JSON.stringify(data.section));
                window.location.assign("<%=MyContext.name%>/home");

            }
        });
    }

    getRecord();

</script>
</body>
</html>
