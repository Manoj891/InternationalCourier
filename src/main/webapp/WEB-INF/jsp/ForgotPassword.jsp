<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/favicon.ico">
    <script src="<%=path%>/bootstrap/js/jquery-3.4.1.min.js" type="text/javascript"></script>

    <script src="<%=path%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <script src="<%=path%>/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
    <link href="<%=path%>/bootstrap/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>

    <link href="<%=path%>/bootstrap/style.css" rel="stylesheet" type="text/css"/>


    <title>MS-Ware Solutions</title>
</head>

<body id="login-body">
<div id="logreg-forms">

    <form id="loginForm" class="form-signin">

        <h3 id="h2">Forgot Password</h3>
        <input type="text" value="" id="loginId" name="loginId" class="form-control" placeholder="Login ID" required
               autofocus="">
        <input type="email" value="" id="email" name="email" class="form-control" placeholder="Email address" required
               style="margin-top: 5px;">

        <button class="btn form-control sub-btn" type="submit">
            Password send in email
        </button>

    </form>

    <script>
          const path = localStorage.getItem("context-path");
        $('#login-body').submit(function (event) {
            event.preventDefault();
            const dataForm = $('form').serializeArray();
            const requestData = {};
            $.each(dataForm, function (i, v) {
                requestData[v.name] = v.value;
            });
            $('.btn').button('loading');
            $.ajax({
                type: "POST",
                url: path + "/public/api/forgot-password",
                contentType: false,
                dataType: "json",
                data: JSON.stringify(requestData),
                catch: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                    $('.btn').button('reset');
                    if (data['error']) {
                        errorMSG(data['error'].message);
                    } else {

                        alert(data.message);
                        window.location.assign("<%= request.getContextPath()%>");
                    }
                }
            });
        });

        function errorMSG(msg) {
            $(".btn").button("reset");
            $.toast({
                heading: "Error",
                text: msg,
                icon: 'error',
                loader: true, // Change it to false to disable loader
                loaderBg: '#FF0000', // To change the background,
                position: 'mid-center'
            });
        }
    </script>
</div>
</body>
</html>
