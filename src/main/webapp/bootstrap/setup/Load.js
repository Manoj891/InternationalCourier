function loadCountry(id){
    const URL = path + "/api/country";
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
         data.forEach((val, index) => {
             $(id).append("<option value='"+val.id+"'>"+val.name+" ["+val.code+"]</option>");
         });
        }
    })
}