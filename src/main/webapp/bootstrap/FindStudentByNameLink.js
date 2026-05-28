var studentData = [];



function findStudentByName(name) {
    var len = name.length;
    var da = name.substring(len - 1, len);
    if (da === " ") {
        $("#studentNameListLink").empty();
        if (name.length > 0) {
            $.ajax({type: "GET", url: path + "/api/Student/StudentInfo/Byname?name=" + name, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    studentData = data;
                    for (let i = 0; i < data.length; i++) {
                        $("#studentNameListLink").append('<option value="' + data[i].regNo + '">' + data[i].name + '</option>');
                    }
                    $("#studentNameListLink").show();
                }});
        }
    }
}
function showList(val) {
    if (val.length > 1) {
        $("#studentNameListLink").show();
    } else {
        $("#studentNameListLink").hide()
    }
}
function setStudent(possion) {

    document.getElementById("studentNameLink").value = studentData[possion].name;
    document.getElementById("academicYearLink").value = studentData[possion].academicYear;
    document.getElementById("programLink").value = studentData[possion].program;
    document.getElementById("classIdLink").value = studentData[possion].classId;
    document.getElementById("rollNoLink").value = studentData[possion].rollNo;
    document.getElementById("fathersNameLink").value = studentData[possion].fatherName;
    document.getElementById("regNoLink").value = studentData[possion].regNo;
}
function moveFocusInStudentList(eventRef) {
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById("studentNameListLink").focus();
        document.getElementById("studentNameListLink").selectedIndex = 0;
        document.getElementById("regNoLink").value = studentData[0].regNo;
        document.getElementById("studentNameLink").value = studentData[0].name;
        document.getElementById("academicYearLink").value = studentData[0].academicYear;
        document.getElementById("programLink").value = studentData[0].program;
        document.getElementById("classIdLink").value = studentData[0].classId;
        document.getElementById("rollNoLink").value = studentData[0].rollNo;
        document.getElementById("fathersNameLink").value = studentData[0].fatherName;
    }
    return true;
}
function getByFathersName(name) {
    var len = name.length;
    var da = name.substring(len - 1, len);
    if (da === " ") {
        $("#fathersNameListLink").empty();
        if (name.length > 0) {
            $.ajax({type: "GET", url: path + "/api/Student/StudentInfo/ByfathersName?name=" + name, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    studentData = data;
                    for (let i = 0; i < data.length; i++) {
                        $("#fathersNameListLink").append('<option value="' + data[i].regNo + '">' + data[i].fatherName + '</option>');
                    }
                    $("#fathersNameListLink").show();
                }});
        }
    }
}
function moveFocusInFathersList(eventRef) {
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById("fathersNameListLink").focus();
        document.getElementById("fathersNameListLink").selectedIndex = 0;
        document.getElementById("regNoLink").value = studentData[0].regNo;
        document.getElementById("studentNameLink").value = studentData[0].name;
        document.getElementById("academicYearLink").value = studentData[0].academicYear;
        document.getElementById("programLink").value = studentData[0].program;
        document.getElementById("classIdLink").value = studentData[0].classId;
        document.getElementById("rollNoLink").value = studentData[0].rollNo;
        document.getElementById("fathersNameLink").value = studentData[0].fatherName;
    }
    return true;
}
function showFathersList(val) {
    if (val.length > 1) {
        $("#fathersNameListLink").show();
    } else {
        $("#fathersNameListLink").hide();
    }
}
function setFathersStudent(possion) {
    document.getElementById("regNoLink").value = studentData[possion].regNo;
    document.getElementById("studentNameLink").value = studentData[possion].name;
    document.getElementById("academicYearLink").value = studentData[possion].academicYear;
    document.getElementById("programLink").value = studentData[possion].program;
    document.getElementById("classIdLink").value = studentData[possion].classId;
    document.getElementById("rollNoLink").value = studentData[possion].rollNo;
    document.getElementById("fathersNameLink").value = studentData[possion].fatherName;
}


function findStudentByRollNoLink()
{
    var academicYear = document.getElementById('academicYearLink').value;
    var program = document.getElementById('programLink').value;
    var classId = document.getElementById('classIdLink').value;
    var rollNo = document.getElementById('rollNoLink').value;
    if (academicYear.length <= 0 || program.length <= 0 || classId.length <= 0 || rollNo.length <= 0) {
        return false;
    }
    var URL = path + "/api/Billing/StuBillingMaster/StudentByRollNo?academicYear=" + academicYear + "&program=" + program + "&classId=" + classId + "&rollNo=" + rollNo;
    $.ajax({type: "GET", url: URL, headers: {'Authorization':  token}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {
            if (!data['error']) {
                document.getElementById("regNoLink").value = data.regNo;
                document.getElementById("studentNameLink").value = data.stuName;
                document.getElementById("fathersNameLink").value = data.fatherName;
            } else {
                errorMSG(data['error'].message);
                document.getElementById("regNoLink").value = "";
                document.getElementById("studentNameLink").value = "";
                document.getElementById("fathersNameLink").value = "";
            }

        }});
}

function findStudentByRegNoLink()
{

    var regNo = document.getElementById('regNoLink').value;
    if (regNo.length < 1) {
        return false;
    }
    var URL = path + "/api/Student/StudentInfo/" + regNo;
    $.ajax({type: "GET", url: URL, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {
            if (!data['error']) {
                document.getElementById("regNoLink").value = data.regNo;
                document.getElementById("studentNameLink").value = data.name;
                document.getElementById("fathersNameLink").value = data.fatherName;
                document.getElementById('academicYearLink').value = data.academicYear;
                document.getElementById('programLink').value = data.program;
                document.getElementById('classIdLink').value = data.classId;
                document.getElementById('rollNoLink').value = data.rollNo;
            } else {
                document.getElementById("regNoLink").value = "";
                document.getElementById("studentNameLink").value = "";
                document.getElementById("fathersNameLink").value = "";
            }

        }});
}

function checkLinkStudent(status)
{
    if (status) {
        $(".linkStudent").show();
    } else {
        document.getElementById("regNoLink").value = "";
        document.getElementById("studentNameLink").value = "";
        document.getElementById("fathersNameLink").value = "";
        document.getElementById('academicYearLink').value = "";
        document.getElementById('programLink').value = "";
        document.getElementById('classIdLink').value = "";
        document.getElementById('rollNoLink').value = "";
        $(".linkStudent").hide();
    }
}