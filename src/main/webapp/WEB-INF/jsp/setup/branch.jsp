<%@include file="../login/header.jsp" %>
<fieldset style="margin-top: 40px;">
    <legend>Branch</legend>
    <form id="dataFrom" onsubmit="return doSave()">
        <div class="row">
            <input type="hidden" name="id" id="id">
            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Branch Name</label>
                <input type="text" name="name" id="name" class="form-control">
            </div>
            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Code</label>
                <input type="text" name="code" id="code" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Address</label>
                <input type="text" name="address" id="address" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Contact No</label>
                <input type="text" name="contactNo" id="contactNo" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Email</label>
                <input type="email" name="email" id="email" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <br>
                <label>&nbsp;</label>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
    </form>
    <hr>
    <div id="table" style="margin-top: 30px"></div>
</fieldset>
<script>
    getRecord();

    function edit(sn) {
        const data = document.getElementById(sn);
        const id = ['id', 'name', 'code', 'email', 'contactNo', 'address'];
        for (let i = 0; i < id.length; i++) {
            document.getElementById(id[i]).value = data.children[i].innerHTML;
        }
    }
    function doSave() {
        const dataForm = $('#dataFrom').serializeArray();
        const requestData = {};
        $.each(dataForm, function (i, v) {
            requestData[v.name] = v.value;
        });
        const URL = path + "/api/branch";
        callApi(URL, requestData, "POST");
        return false;
    }
    function getRecord() {
        const URL = path + "/api/branch";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.length === 0) {
                    errorMSG('Record Not Found');
                    document.getElementById('table').innerHTML = '';
                    return false;
                }
                document.getElementById('table').innerHTML = `<table class='table table-bordered table-hover table-striped' id='dataTable'><thead>
<tr><th hidden></th><th>Name</th><th>Code</th><th>Email</th><th>Contact No</th><th>Address</th><th style="width:50px"></th><th style="width:50px"></th></tr></thead><tbody></tbody></table>`;
                for (let i = 0; i < data.length; i++) {
                    $('#dataTable').append(`<tr id='` + i + `'>
<td hidden>` + data[i].id + `</td>
<td>` + data[i].name + `</td>
<td>` + data[i].code + `</td>
<td>` + data[i].email + `</td>
<td>` + data[i].contactNo + `</td>
<td>` + data[i].address + `</td>
<td>
<a title='Edit' onclick='edit(` + (i) + `)' class='glyphicon glyphicon-edit' href='#'>Edit</a>
</td><td> <a title='Delete' onclick='recordDelete("` + data[i].id + `")' class='glyphicon glyphicon-remove-circle' href='#'>Del</a>
</td></tr>`);
                }
                $('#dataTable').DataTable();
            },
            error: function (XMLHttpRequest) {
                ajaxException(XMLHttpRequest);
            }
        });
    }
    function recordDelete(id) {
        if (!confirm('Are you sure')) {
            return;
        }
        const URL = path + "/api/branch/" + id;
        callApi(URL, "", "DELETE");
    }
</script>
<%@include file="../login/footer.jsp" %>