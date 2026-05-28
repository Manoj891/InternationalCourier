var FindChartOfInventoryFixedAsset = [];
function moveFocusInListInventory(eventRef, acCode, acName, store) {
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById(acCode).focus();
        document.getElementById(acCode).selectedIndex = 0;
        document.getElementById(acName).value = FindChartOfInventoryFixedAsset[0].acName;
        if (FindChartOfInventoryFixedAsset[0].storeQty > 0) {
            document.getElementById(store).value = FindChartOfInventoryFixedAsset[0].storeQty;
        }
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
function changePossionInventory(possion, acCode, acName, store) {
    document.getElementById(acCode).value = FindChartOfInventoryFixedAsset[possion].acCode;
    document.getElementById(acName).value = FindChartOfInventoryFixedAsset[possion].acName;
    if (FindChartOfInventoryFixedAsset[possion].storeQty > 0) {
        document.getElementById(store).value = FindChartOfInventoryFixedAsset[possion].storeQty;
    }

}
function getAccountNameInventory(ac, acCode) {
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $(acCode).empty();
        if (ac.length > 2) {
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount/InventoryFixedAssetByname?name=" + ac, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    FindChartOfInventoryFixedAsset = data;
                    for (let i = 0; i < FindChartOfInventoryFixedAsset.length; i++) {
                        $(acCode).append('<option value="' + FindChartOfInventoryFixedAsset[i].acCode + '">' + FindChartOfInventoryFixedAsset[i].acName + '</option>');
                    }
                    $(acCode).show();
                }});
        }
    } else {
        $(acCode).hide();
    }
}


function getAccountNameInventoryIssue(ac, acCode) {
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $(acCode).empty();
        if (ac.length > 2) {
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount/InventoryFixedAssetIssueByname?name=" + ac, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    FindChartOfInventoryFixedAsset = data;
                    for (let i = 0; i < FindChartOfInventoryFixedAsset.length; i++) {
                        $(acCode).append('<option value="' + FindChartOfInventoryFixedAsset[i].acCode + '">' + FindChartOfInventoryFixedAsset[i].acName + '</option>');
                    }
                    $(acCode).show();
                }});
        }
    } else {
        $(acCode).hide();
    }
}