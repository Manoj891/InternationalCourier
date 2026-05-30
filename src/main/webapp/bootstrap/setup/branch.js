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
            data.forEach((val, index) => {
                $('#dataTable').append(`<tr id='` + index + `'>
<td hidden>` + val.id + `</td>
<td>` + val.name + `</td>
<td>` + val.code + `</td>
<td>` + val.email + `</td>
<td>` + val.contactNo + `</td>
<td>` + val.address + `</td>
<td>
<a title='Edit' onclick='edit(` + index + `)' class='glyphicon glyphicon-edit' href='#'>Edit</a>
</td><td> <a title='Delete' onclick='recordDelete("` + val.id + `")' class='glyphicon glyphicon-remove-circle' href='#'>Del</a>
</td></tr>`);

            });


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