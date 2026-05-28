<%@include file="../login/header.jsp" %>

<div class='col-lg-12 col-sm-12 col-md-12 col-xs-12' style="text-align: center; color: #032B43;">
    <h1 id="orgnization-names-detail">
    </h1>
</div>

<div style="clear: both"></div>

<div class="h-c-c" id="columnchart_material"></div>
<div style="clear: both"></div>

<div class='row' style="margin-top: 30px;margin-bottom: 20px">
    <div class='col-lg-1 col-sm-1 col-md-1 col-xs-6' style="text-align: right;"><label>Date</label></div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
        <input type="text" class="form-control" id="date-homepage" value="" onkeyup="loadPIchart()"/>
    </div>
    <div class='col-lg-1 col-sm-1 col-md-1 col-xs-6' style="text-align: right;"><label>Class</label></div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
        <select name="classId" id="classId" class="form-control"></select>
    </div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
        <input type='submit' style="width: 90%" value='Present' class='btn btn-success' onclick="getStudentList('P')"/>
    </div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
        <input type='submit' style="width: 90%" value='Absent' class='btn btn-success' onclick="getStudentList('A')"/>
    </div>
</div>

<div class='col-lg-12 col-sm-12 col-md-12 col-xs-12' style="margin-bottom: 100px;">
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>SN</th>
            <th>Id</th>
            <th>Name</th>
            <th>Class</th>
            <th>In Time</th>
            <th>Out Time</th>
            <th>Remark</th>
        </tr>
        </thead>
        <tbody id="tableData"></tbody>
    </table>
</div>
<br><br><br>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    document.getElementById("orgnization-names-detail").innerHTML=localStorage.getItem("organization-name");
    getClassMaster("#classId");
    const date = new Date();

    document.getElementById("date-homepage").value = date.toISOString().split('T')[0];


    function getStudentList(val) {
        const date = document.getElementById("date-homepage").value;
        const classId = document.getElementById("classId").value;
        if (date.length !== 10) return false;
        $("#tableData").empty();
        $.ajax({
            type: "GET",
            url: path + "/api/dashboard/" + date + "/" + val + "?classId=" + classId,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (list) {
                list.forEach((d, index) => {
                    $("#tableData").append(`<tr><td>` + (index + 1) + `</td><td>` + d.id + `</td><td>` + d.stuName + `</td><td>` + d.className + `</td><td>` + d.inTime + `</td><td>` + (d.outTime === null ? '' : d.outTime) + `</td><td>` + d.remark + `</td></tr>`);
                });
            }
        });
    }
</script>
<script type="text/javascript">

    function loadPIchart() {
        const date = document.getElementById("date-homepage").value;
        if (date.length !== 10) return false;
        google.charts.load('current', {'packages': ['bar']});
        google.charts.load("current", {packages: ["corechart"]});
        let totalPresent = 0;
        let totalAbsent = 0;
        let attendance = [];
        const URL = path + "/api/dashboard/" + date;
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                attendance = res.data;
                totalPresent = res.totalPresent;
                totalAbsent = res.totalAbsent;
                google.charts.setOnLoadCallback(drawChart);
            }
        });

        function drawChart() {
            const data = google.visualization.arrayToDataTable(attendance);
            const options = {
                height: 450,
                chart: {
                    title: "Date: " + date + ", Present:" + totalPresent + ", Absent:" + totalAbsent,
                    subtitle: 'Class wise attendance '
                }
            };
            const chart = new google.charts.Bar(document.getElementById('columnchart_material'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }


</script>


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
                    M.S.Ware Online Solution </p>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-xs-12">
                <div class="col-xs-6 col-sm-6 col-md-6 col-xs-6">
                    <p style="margin: 2px;margin-top: 6px;"><i class="fas fa-phone-square-alt" id="fa-institution-name-tel"></i>
                    </p>
                </div>

            </div>
        </div>
    </div>
    <script>
        document.getElementById("fa-institution-name").innerHTML=localStorage.getItem("organization-name");
        document.getElementById("fa-institution-name-tel").innerHTML="&nbsp;&nbsp; Tel No:"+localStorage.getItem("organization-tel");
        loadPIchart();</script>
</footer>
</body>
</html>