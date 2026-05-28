
</div>
<div class="modal fade container" id="searchModelBox" role="dialog" tabindex="-1">
    <div class="modal-content">
        <div class="modal-header">
            <form class="form-inline my-2 my-lg-0">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <input class="form-control mr-sm-2" id="searchModelBoxDetailName" onkeyup="getStudentByName()"
                       type="search" placeholder="Search" aria-label="Search">
                <!--<button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>-->
            </form>
        </div>
        <div class="modal-body">
            <div class='row' id='searchModelBoxDetail' style="overflow: auto; ">
                <table class='table table-bordered table-hover table-striped'>
                    <thead>
                    <tr>
                        <th>Reg No</th>
                        <th>Student Name</th>
                        <th>Father's Name</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Year</th>
                        <th>Class</th>
                        <th>Program</th>
                        <th>Roll No</th>
                    </tr>
                    </thead>
                    <tbody id='searchModelDataTable'></tbody>
                </table>
            </div>
        </div>
    </div>
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
                    <p style="margin: 2px;margin-top: 6px;"><i class="fas fa-phone-square-alt" id="fa-institution-name-tel"></i>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    document.getElementById("fa-institution-name").innerHTML=localStorage.getItem("organization-name");
    document.getElementById("fa-institution-name-tel").innerHTML="&nbsp;&nbsp; Tel No:"+localStorage.getItem("organization-tel");
    function getStudentByName() {
        const ac = document.getElementById('searchModelBoxDetailName').value;
        var len = ac.length;
        var da = ac.substring(len - 1, len);
        if (da === " ") {
            $("#searchModelDataTable").empty();
            $.ajax({
                type: "GET",
                url: path + "/api/Student/ByStuFathers?name=" + ac,
                headers: {'Authorization': token},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var tableData;
                    for (let i = 0; i < data.length; i++) {
                        tableData = "<tr><td>" + data[i].regNo + "</td><td>" + data[i].name + "</td><td>" + data[i].fatherName + "</td><td>" + data[i].mobileNo + "</td><td>" + data[i].email + "</td><td>" + data[i].academicYear + "</td><td>" + data[i].class + "</td><td>" + data[i].program + "</td><td>" + data[i].rollNo + "</td></tr>";
                        $('#searchModelDataTable').append(tableData);
                    }

                }
            });
        }
    }

    function ajaxException(XMLHttpRequest) {
        $('.btn').button('reset');
        alert(XMLHttpRequest.responseJSON.message);

    }
</script>
</body>
</html>