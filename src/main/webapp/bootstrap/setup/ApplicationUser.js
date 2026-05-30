loadBranch();
getRecord();

// ================= SAVE =================
function doSave() {

    const formArray = $('#dataFrom').serializeArray();
    const obj = {};

    $.each(formArray, function (i, v) {
        obj[v.name] = v.value;
    });

    const URL = path + "/api/application-user";
    callApi(URL, obj, "POST");

    return false;
}

// ================= GET USERS =================
function getRecord() {

    const URL = path + "/api/application-user";

    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        dataType: "json",
        success: function (data) {

            document.getElementById('table').innerHTML = `
                <table class="table table-bordered table-hover table-striped" id="dataTable">
                    <thead>
                        <tr>
                            <th hidden>ID</th>
                            <th>Username</th>
                            <th>User Type</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Branch</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>`;

            if (!data || data.length === 0) return;

            data.forEach((val, index) => {

                $('#dataTable tbody').append(`
                        <tr id="${index}">
                            <td hidden>${val.id}</td>
                            <td>${val.username || ''}</td>
                            <td>${val.usertype || ''}</td>
                            <td>${val.email || ''}</td>
                            <td>${val.mobileNo || ''}</td>

                            <td data-branch="${val.branch}">
                                ${val.branchName || ''}
                            </td>

                            <td>
                                <a href="#" onclick="edit(${index})">
                                    Edit
                                </a>
                            </td>

                            <td>
                                <a href="#" onclick="recordDelete(${val.id})">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    `);
            });

            $('#dataTable').DataTable();
        },
        error: function (err) {
            ajaxException(err);
        }
    });
}

// ================= EDIT =================
function edit(sn) {

    const row = document.getElementById(sn);

    document.getElementById('id').value = row.children[0].innerText;
    document.getElementById('username').value = row.children[1].innerText;
    document.getElementById('usertype').value = row.children[2].innerText;
    document.getElementById('email').value = row.children[3].innerText;
    document.getElementById('mobileNo').value = row.children[4].innerText;

    const branchId = row.children[5].getAttribute("data-branch");
    document.getElementById('branch').value = branchId;
}

// ================= DELETE =================
function recordDelete(id) {

    if (!confirm("Are you sure?")) return;

    const URL = path + "/api/application-user/" + id;
    callApi(URL, "", "DELETE");
}

// ================= LOAD BRANCH =================
function loadBranch() {


    const URL = path + "/api/branch";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $('#branch').empty().append(`<option value="">Select Branch</option>`);
            data.forEach(function (b) {
                $('#branch').append(`<option value="${b.id}">${b.name}</option>`);
            });
        }
    });
}

