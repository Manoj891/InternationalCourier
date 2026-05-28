
function getbarcodeGeneratorSingle(bookId)
{
    $("#bookBarcodeSingle").show();
    var URL = path + "/api/Library/BookStock/" + bookId;
    $.ajax({type: "GET", url: URL, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {

            $('#bookBarcodeSingle').empty().append("<div class='row'>");
            for (var i = 1; i <= data.length; i++)
            {
                $('#bookBarcodeSingle').append(`
<div class='row' style="margin-bottom: -15px;">
<img id="barcode` + (i - 1) + `" draggable="false"/></div>
 <div style="page-break-after: always;"></div>`);

            }
            for (let i = 0; i < data.length; i++)
            {
                barcodeGenerator("#barcode" + i, data[i].id);
            }
            printBarcodeSingle();

        }
    }
    );
}

function printBarcodeSingle() {
    $('.print').hide();
    let printContents, popupWin;
    printContents = document.getElementById("bookBarcodeSingle").innerHTML;
    popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
            <html>
               <link href="` + path + `/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="` + path + `/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="` + path + `/bootstrap/css/font-awesome.css" rel="stylesheet" type="text/css"/>        
              <style>.row{margin-bottom: 40px;}</style></head>
          <body onload="window.print();window.close()">` + printContents + `</body>
            </html>`
            );
    $('.print').show();
    popupWin.document.close();
}

function barcodeGenerator(barcode, barcodeText)
{
    JsBarcode(barcode, barcodeText);
}
