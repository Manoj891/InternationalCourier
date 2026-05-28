var ChartOfInventory = [];
function moveFocusInListInventory(eventRef, acCode, acName) {
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById(acCode).focus();
        document.getElementById(acCode).selectedIndex = 0;
        document.getElementById(acName).value = ChartOfInventory[0].acName;
    }
    return true;
}
function showListInventory(acCode, acName) {
    if (acName.length > 1) {
        $(acCode).show();
    } else {
        $(acName).hide()
    }
}
function changePossionInventory(possion, acCode, acName) {
    document.getElementById(acCode).value = ChartOfInventory[possion].acCode;
    document.getElementById(acName).value = ChartOfInventory[possion].acName;

}
function getAccountNameInventory(ac, acCode) {
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $(acCode).empty();
        if (ac.length > 0) {
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount/InventoryByname?name=" + ac, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    ChartOfInventory = data;
                    for (let i = 0; i < ChartOfInventory.length; i++) {
                        $(acCode).append('<option value="' + ChartOfInventory[i].acCode + '">' + ChartOfInventory[i].acName + '</option>');
                    }
                    $(acCode).show();
                }});
        }
    } else {
        $(acCode).hide();
    }
}
