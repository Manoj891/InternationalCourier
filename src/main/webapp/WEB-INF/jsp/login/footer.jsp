</div>

<div style="margin-top: 50px;"></div>
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-xs-12">
                <p style="padding:2px;"><i class="fa fa-institution" id="fa-institution-name"></i>
                </p>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-xs-12">
                <p style="padding: 2px;"><i class="fa fa-copyright"></i>
                    M.S.Ware Online Solution</p>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-xs-12">
                <div class="col-xs-6 col-sm-6 col-md-6 col-xs-6">
                    <p style="margin: 2px;margin-top: 6px;"><i class="fas fa-phone-square-alt"
                                                               id="fa-institution-name-tel"></i>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    document.getElementById("fa-institution-name").innerHTML = localStorage.getItem("organization-name");
    document.getElementById("fa-institution-name-tel").innerHTML = "&nbsp;&nbsp; Tel No:" + localStorage.getItem("organization-tel");


    function callApi(URL, requestData, apiMethod) {
        $('.btn').button('loading');
        $.ajax({
            type: apiMethod,
            url: URL,
            headers: {'Authorization': token},
            data: JSON.stringify(requestData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('.btn').button('reset');
                messages("Success");
                document.getElementById('dataFrom').reset();
                getRecord();
            },
            error: function (XMLHttpRequest) {
                ajaxException(XMLHttpRequest);
            }
        });
    }

    function ajaxException(XMLHttpRequest) {
        $('.btn').button('reset');
        alert(XMLHttpRequest.responseJSON.message);
    }
</script>
</body>
</html>