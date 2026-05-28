function findEmployeeInfo(id) {
    var URL = path + "/api/Employee/EmployeeInfo/find";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append('<option value="">Select</option>');
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option value="' + data[i].id + '">' + data[i].name + ' (' + data[i].mobile + ')</option>');
            }
        }
    });
}

function getExamMaster(id) {
    const URL = path + "/api/Exam/ExamMaster";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append('<option value="">Select</option>');
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option value="' + data[i].id + '">' + data[i].examName + '</option>');
            }
        }
    });
}

function getSubjectGroup(id) {
    const jsonData = localStorage.getItem("subjectGroup");
    if (jsonData && jsonData !== "undefined") {
        const data = JSON.parse(jsonData);
        $(id).empty();
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }
        $(id).append('<option value="">Select</option>');
    } else {
        const URL = path + "/api/Setup/SubjectGroup";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty();
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                }
                $(id).append('<option value="">Select</option>');
            }
        });
    }
}

function getSubjectMaster(id) {
    var URL = path + "/api/Setup/SubjectMaster";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append(`<option value="">Select</option>`);
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });
}

function getDistrictMaster(id, province) {
    const URL = path + "/api/Setup/DistrictMaster?province=" + province;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append('<option value="">Select</option>');
            ;
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option>' + data[i].name + '</option>');
            }
        }
    });
}

function getMunicipalMaster(id, district) {
    const URL = path + "/api/Setup/MunicipalMaster?district=" + district;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append('<option value="">Select</option>');
            ;
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option>' + data[i].name + '</option>');
            }
        }
    });
}

function getFiscalYear(id) {
    var URL = path + "/api/Account/FiscalYear";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty();
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option value="' + data[i].id + '">' + data[i].year + '</option>');
            }
        }
    });
}

function getSundryCreditorsMaster(id) {
    const jsonData = localStorage.getItem("sundryCreditors");
    if (jsonData && jsonData !== "undefined") {
        const data = JSON.parse(jsonData);
        $(id).empty().append('<option value="">Select</option>');
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }
    } else {
        var URL = path + "/api/Inventory/SundryCreditors";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty().append('<option value="">Select</option>');
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                }
            }
        });
    }
}

function getAcademicYear(id) {
    const jsonData = localStorage.getItem("academicYear");
    if (jsonData && jsonData !== "undefined") {
        var data = JSON.parse(jsonData);
        $(id).empty();
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].year + '</option>');
        }
        $(id).append('<option value="">Select</option>');
    } else {
        var URL = path + "/api/Setup/AcademicYear";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty();
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].year + '</option>');
                }
                $(id).append('<option value="">Select</option>');
            }
        });
    }
}

function getClassMaster(id) {
    var jsonData = localStorage.getItem("classMaster");
    if (jsonData && jsonData !== "undefined") {
        var data = JSON.parse(jsonData);
        $(id).empty().append(' <option value="">Select</option>');
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }
    } else {
        var URL = path + "/api/Setup/ClassMaster";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty().append(' <option value="">Select</option>');
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                }
            }
        });
    }
}

function getProgramMaster(id) {
    var jsonData = localStorage.getItem("programMaster");
    if (jsonData && jsonData !== "undefined") {
        var data = JSON.parse(jsonData);
        $(id).empty();
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }
        $(id).append('<option value="">Select</option>');
    } else {
        var URL = path + "/api/Setup/ProgramMaster";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty();
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                }
                $(id).append('<option value="">Select</option>');
            }
        });
    }
}


function getSectionMaster(id) {
    let jsonData = localStorage.getItem("section");
    if (jsonData && jsonData !== "undefined") {
        let data = JSON.parse(jsonData);
        $(id).empty().append('<option value="">Select</option>');
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].name + '">' + data[i].name + '</option>');
        }
    } else {
        let URL = path + "/api/Setup/Section";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty().append('<option value="">Select</option>');
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].name + '">' + data[i].name + '</option>');
                }

            }
        });
    }
}

function getBillMasterAll(id) {

    $.ajax({
        type: "GET",
        url: path + "/api/Setup/BillMaster/all",
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(id).empty().append(' <option value="">Select</option>');
            for (let i = 0; i < data.length; i++) {
                $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }

        }
    });

}

function getBillMaster(id) {
    var jsonData = localStorage.getItem("billMaster");
    if (jsonData && jsonData !== "undefined") {
        var data = JSON.parse(jsonData);
        $(id).empty();
        for (let i = 0; i < data.length; i++) {
            $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }
        $(id).append('<option value="">Select</option>');
    } else {
        var URL = path + "/api/Setup/BillMaster";
        $.ajax({
            type: "GET",
            url: URL,
            headers: {'Authorization': token},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(id).empty().append(' <option value="">Select</option>');
                for (let i = 0; i < data.length; i++) {
                    $(id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                }
                $(id).append('<option value="">Select</option>');
            }
        });
    }
}

function findStudentByRollNo() {
    const academicYear = document.getElementById('academicYear').value;
    const program = document.getElementById('program').value;
    const classId = document.getElementById('classId').value;
    const rollNo = document.getElementById('rollNo').value;
    let section = document.getElementById("section").value;
    if (academicYear.length <= 0 || program.length <= 0 || classId.length <= 0 || rollNo.length <= 0) {
        return false;
    }
    if (!section) section = "";
    const URL = path + "/api/Billing/StuBillingMaster/StudentByRollNo?academicYear=" + academicYear + "&program=" + program + "&classId=" + classId + "&rollNo=" + rollNo + "&section=" + section;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (!data['error']) {

                document.getElementById("regNo").value = data.regNo;
                document.getElementById("studentName").value = data.name;
                document.getElementById("academicYear").value = data.academicYear;
                document.getElementById("program").value = data.program;
                document.getElementById("classId").value = data.classId;
                document.getElementById("rollNo").value = data.rollNo;
                document.getElementById("fathersName").value = data.fatherName;
                document.getElementById("section").value = data.section;
                document.getElementById("search-button").focus();
            } else {
                errorMSG(data['error'].message);
                document.getElementById("regNo").value = "";
                document.getElementById("studentName").value = "";
                document.getElementById("fathersName").value = "";
            }

        }
    });
}

function findStudentByRegNo() {

    const regNo = document.getElementById('regNo').value;
    if (regNo.length < 1) {
        return false;
    }
    const URL = path + "/api/Student/StudentInfo/" + regNo;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (!data['error']) {
                document.getElementById("regNo").value = data.regNo;
                document.getElementById("studentName").value = data.name;
                document.getElementById("fathersName").value = data.fatherName;
                document.getElementById('academicYear').value = data.academicYear;
                document.getElementById('program').value = data.program;
                document.getElementById('classId').value = data.classId;
                document.getElementById('rollNo').value = data.rollNo;
                document.getElementById('section').value = data.section;
                document.getElementById("search-button").focus();

            } else {
                document.getElementById("regNo").value = "";
                document.getElementById("studentName").value = "";
                document.getElementById("fathersName").value = "";
            }
            return true;

        }
    });
}