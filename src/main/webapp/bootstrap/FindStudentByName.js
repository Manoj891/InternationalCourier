let studentData = [];


function findStudentByName(name) {
    const len = name.length;
    const da = name.substring(len - 1, len);
    if (da === " ") {
        $("#studentNameList").empty();
        if (name.length > 0) {
            $.ajax({
                type: "GET",
                url: path + "/api/Student/StudentInfo/Byname?name=" + name,
                headers: {'Authorization': token},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    studentData = data;
                    for (let i = 0; i < data.length; i++) {
                        $("#studentNameList").append('<option value="' + data[i].regNo + '">' + data[i].name + '</option>');
                    }
                    $("#studentNameList").show();
                }
            });
        }
    }
}

function showList(val) {
    if (val.length > 1) {
        $("#studentNameList").show();
    } else {
        $("#studentNameList").hide()
    }
}

function setStudent(possion) {

    document.getElementById("studentName").value = studentData[possion].name;
    document.getElementById("academicYear").value = studentData[possion].academicYear;
    document.getElementById("program").value = studentData[possion].program;
    document.getElementById("classId").value = studentData[possion].classId;
    document.getElementById("rollNo").value = studentData[possion].rollNo;
    document.getElementById("fathersName").value = studentData[possion].fatherName;
    document.getElementById("regNo").value = studentData[possion].regNo;
    document.getElementById("section").value = studentData[possion].section;
}

function moveFocusInStudentList(eventRef) {
    const charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById("studentNameList").focus();
        document.getElementById("studentNameList").selectedIndex = 0;
        document.getElementById("regNo").value = studentData[0].regNo;
        document.getElementById("studentName").value = studentData[0].name;
        document.getElementById("academicYear").value = studentData[0].academicYear;
        document.getElementById("program").value = studentData[0].program;
        document.getElementById("classId").value = studentData[0].classId;
        document.getElementById("rollNo").value = studentData[0].rollNo;
        document.getElementById("fathersName").value = studentData[0].fatherName;
        document.getElementById("section").value = studentData[0].section;
    }
    return true;
}

function getByFathersName(name) {
    const len = name.length;
    const da = name.substring(len - 1, len);
    if (da === " ") {
        $("#fathersNameList").empty();
        if (name.length > 0) {
            $.ajax({
                type: "GET",
                url: path + "/api/Student/StudentInfo/ByfathersName?name=" + name,
                headers: {'Authorization': token},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    studentData = data;
                    for (let i = 0; i < data.length; i++) {
                        $("#fathersNameList").append('<option value="' + data[i].regNo + '">' + data[i].fatherName + '</option>');
                    }
                    $("#fathersNameList").show();
                }
            });
        }
    }
}

function moveFocusInFathersList(eventRef) {
    const charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById("fathersNameList").focus();
        document.getElementById("fathersNameList").selectedIndex = 0;
        document.getElementById("regNo").value = studentData[0].regNo;
        document.getElementById("studentName").value = studentData[0].name;
        document.getElementById("academicYear").value = studentData[0].academicYear;
        document.getElementById("program").value = studentData[0].program;
        document.getElementById("classId").value = studentData[0].classId;
        document.getElementById("rollNo").value = studentData[0].rollNo;
        document.getElementById("fathersName").value = studentData[0].fatherName;
        document.getElementById("section").value = studentData[0].section;
    }
    return true;
}

function showFathersList(val) {
    if (val.length > 1) {
        $("#fathersNameList").show();
    } else {
        $("#fathersNameList").hide()
    }
}

function setFathersStudent(possion) {
    document.getElementById("regNo").value = studentData[possion].regNo;
    document.getElementById("studentName").value = studentData[possion].name;
    document.getElementById("academicYear").value = studentData[possion].academicYear;
    document.getElementById("program").value = studentData[possion].program;
    document.getElementById("classId").value = studentData[possion].classId;
    document.getElementById("rollNo").value = studentData[possion].rollNo;
    document.getElementById("fathersName").value = studentData[possion].fatherName;
    document.getElementById("section").value = studentData[possion].section;
}

function setNextAction() {
    $('#studentNameList').hide();
    document.getElementById("search-button").focus();
}

function getMonthName(month) {

    if (month === "01") {
        return "Baisakh";
    } else if (month === "02") {
        return "Jeshtha";
    } else if (month === "03") {
        return "Aashad";
    } else if (month === "04") {
        return "Shrawan";
    } else if (month === "05") {
        return "Bhadra";
    } else if (month === "06") {
        return "Aashwin";
    } else if (month === "07") {
        return "Kartik";
    } else if (month === "08") {
        return "Mangsir";
    } else if (month === "09") {
        return "Push";
    } else if (month === "10") {
        return "Magh";
    } else if (month === "11") {
        return "Falgun";
    } else if (month === "12") {
        return "Chaitra";
    } else {
        return "";
    }
}