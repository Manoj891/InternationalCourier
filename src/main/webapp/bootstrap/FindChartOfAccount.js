var ChartOfAccount = [];
function moveFocusInList(eventRef, acCode, acName) {
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById(acCode).focus();
        document.getElementById(acCode).selectedIndex = 0;
        document.getElementById(acName).value = ChartOfAccount[0].acName;
    }
    return true;
}
function showList(acCode, acName) {
    if (acName.length > 1) {
        $(acCode).show();
    } else {
        $(acName).hide()
    }
}
function changePossion(possion, acCode, acName) {
    document.getElementById(acCode).value = ChartOfAccount[possion].acCode;
    document.getElementById(acName).value = ChartOfAccount[possion].acName;

}
function getAccountName(ac, acCode) {
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $(acCode).empty();
        if (ac.length > 0) {
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount/Byname?name=" + ac, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    ChartOfAccount = data;
                    for (let i = 0; i < ChartOfAccount.length; i++) {
                        $(acCode).append('<option value="' + ChartOfAccount[i].acCode + '">' + ChartOfAccount[i].acName + '</option>');
                    }
                    $(acCode).show();
                }});
        }
    } else {
        $(acCode).hide();
    }
}



