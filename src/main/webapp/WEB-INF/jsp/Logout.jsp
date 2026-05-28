<%@ page import="com.ms.ware.online.solution.config.MyContext" %><%--
    Document   : Logout
    Created on : Mar 27, 2020, 7:07:52 PM
    Author     : MS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
<script>
    localStorage.removeItem("token");
    localStorage.removeItem("section");
    localStorage.removeItem("sundryCreditors");
    localStorage.removeItem("billMaster");
    localStorage.removeItem("fiscalYear");
    localStorage.removeItem("subjectGroup");
    localStorage.removeItem("academicYear");
    localStorage.removeItem("classMaster");
    localStorage.removeItem("programMaster");
    const doc = localStorage.getItem("document-path");
    let path = localStorage.getItem("context-path");
    path = path.replace("/edulink/", "")
    window.location.assign("<%= MyContext.name%>/Login?path=" + path + "doc=" + doc);
</script>
</body>
</html>
