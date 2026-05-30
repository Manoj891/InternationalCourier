
document.getElementById("fa-institution-name").innerHTML = localStorage.getItem("organization-name");
document.getElementById("fa-institution-name-tel").innerHTML = "&nbsp;&nbsp; Tel No:" + localStorage.getItem("organization-tel");


function callApi(URL, requestData, apiMethod) {
    $('.btn').button('loading');
    $.ajax({
        type: apiMethod,
        url: URL,
        headers: {'Authorization': token},
        data: JSON.stringify(requestData),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('.btn').button('reset');
            messages("Success");
            document.getElementById('dataFrom').reset();
            getRecord();
        },
        error: function (XMLHttpRequest) {
            ajaxException(XMLHttpRequest);
        }
    });
}

function ajaxException(XMLHttpRequest) {
    $('.btn').button('reset');
    alert(XMLHttpRequest.responseJSON.message);
}


function errorStatus(XMLHttpRequest) {

    $('.btn').button('reset');
    $.toast({
        heading: "Error",
        text: XMLHttpRequest.responseText,
        icon: 'error',
        loader: true, // Change it to false to disable loader
        loaderBg: '#FF0000', // To change the background,
        position: 'mid-center'
    });
}

function errorMSG(msg) {
    $('.btn').button('reset');
    $.toast({
        heading: "Error",
        text: msg,
        icon: 'error',
        loader: true, // Change it to false to disable loader
        loaderBg: '#FF0000', // To change the background,
        position: 'mid-center'
    });
}

function messages(msg) {
    $('.btn').button('reset');
    $.toast({
        heading: "Messages",
        text: msg,
        icon: 'info',
        loader: true, // Change it to false to disable loader
        loaderBg: '#FFFFFF', // To change the background,
        position: 'mid-center'
    });
}
