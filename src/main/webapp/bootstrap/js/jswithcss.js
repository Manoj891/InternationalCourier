function resetForm() {
    $('#Update').hide();
    $('#Cancel').hide();
    $('#Save').show();
    actionStatus = true;
    document.getElementById('dataFrom').reset();
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

function excelExport(tableId, filename) {

    // Retrieve the table element
    const table = document.getElementById(tableId);

    // Retrieve the table's HTML
    const tableHTML = table.outerHTML;

    // Define custom CSS
    const customCSS = `
        <style>
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid black; padding: 8px; text-align: left; }
            th { background-color: #f2f2f2; }
            .highlight { background-color: #ff0; }
        </style>
    `;

    // Create a complete HTML document with the table and custom CSS
    const html = `
        <html>
        <head>${customCSS}</head>
        <body>${tableHTML}</body>
        </html>
    `;

    // Create a data URI
    const uri = 'data:application/vnd.ms-excel,' + encodeURIComponent(html);

    // Create a link element
    const link = document.createElement('a');
    link.href = uri;

    // Set the filename
    link.download = filename + ".xls";

    // Append the link to the document and trigger the download
    document.body.appendChild(link);
    link.click();

    // Remove the link after the download
    document.body.removeChild(link);
}

function printDiv(div) {
    $('.print').hide();
    let printContents, popupWin;
    printContents = document.getElementById(div).innerHTML;
    popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
            <html>
              <head>
                <title>Print tab</title>
      <link href="` + path + `/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
                <style>
   
                .p{
                  margin-bottom: 5px;
                }
                .table-bordered {
                    border: 1px solid #eceeef;
                }
                .table {
                  position:relative;
                  width: 100%;
                  max-width: 100%;
                  margin-top: 20px;
                  margin-bottom: 1rem;
                  font-size: smaller;
                }
                .table {
                  border-collapse: collapse;
                  background-color: transparent;
                }
                .table-bordered th, .table-bordered td {
                    border: 1px solid #eceeef;
                }
                .table th, .table td {
                    padding: 0.55rem;
                    vertical-align: top;
                    border-top: 1px solid #eceeef;
                    text-align:left;
                }
                .last-td{
                  display:none;
                }
                //........Customized style.......
                </style>
              </head>
          <body onload="window.print();window.close()">` + printContents + `</body>
            </html>`
    );
    $('.print').show();
    popupWin.document.close();
}

function getVoucher(voucherNo, divId) {
    var URL = path + "/api/Account/VoucherData/" + voucherNo;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (res) {
            if (res['error']) {
                messages(res['message']);
                return false;
            }
            var tableData = ` <div class="modal fade" id="myModal" role="dialog" style='height:85%;width:80%;margin:60px auto 0!important;'>
            <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>                    
             </div>
            <div class="modal-body" style="margin:0 auto;" id='voucherDataPrint'>             
            <table class='table table-bordered table-hover table-striped' id='voucherDataExcel'>
                    <tr><td colspan='2'>
                    <img src="`+localStorage.getItem("document-path")+`/Organization/Logo.png" width="100" height="100" alt="Logo">
</td> 
                    <td colspan='6'><b>
                        <div style="text-align: center;font-size: 20px;"> ` + localStorage.getItem("organization-name") + `</div>
                        <div style="text-align: center;font-size: 14px;"> ` + localStorage.getItem("organization-address") + `</div>
                           <div style="text-align: center;font-size: 20px;"><b>Voucher</b></div>
                          <div> <span style="float: left"> Voucher No : ` + res.voucherNo + ` </span><span style="float: right"> Voucher Amount : <b id="voucher-amount-total"></b></span></div>
                   </b></td></tr>    
                    <tr><td>SN</td><td>Ac Code</td><td>Ac Name</td><td>Particular</td><td>Cheque No</td><td>Bill No</td><td>Dr</td><td>Cr</td></tr>`;

            const data = res.detail;
            let totalDr = 0, totalCr = 0;
            for (let i = 0; i < data.length; i++) {
                totalDr = totalDr + parseFloat("0" + data[i].dr);
                totalCr = totalCr + parseFloat("0" + data[i].cr);
                tableData = tableData + `<tr><td>` + (i + 1) + `</td><td>` + data[i].acCode + `</td><td>` + data[i].acName + `</td><td>` + data[i].particular + `</td><td>` + data[i].chequeNo + `</td><td>` + data[i].billNo + `</td><td>` + data[i].dr.toFixed(2) + `</td><td>` + data[i].cr.toFixed(2) + `</td></tr>`;
            }
            tableData = tableData + `<tr><td></td><td></td><td></td><td>Total</td><td></td><td></td><td>` + totalDr.toFixed(2) + `</td><td>` + totalCr.toFixed(2)+ `</td></tr>`;

            tableData = tableData + `<tr><td colspan='8' style="text-align: left"> Narration : ` + res.narration + `</td></tr>`;
            tableData = tableData + `<tr><td colspan='8'>
<div style="float: left;width: 49%;">
<div style="float: left;width: 49%;">
<div>-------------------------</div>
<div>Received By : </div>
<div>Received Date : </div>
</div>
<div style="float: right;width: 49%;">
<div>-------------------------</div>
<div>Entered By : ` + res.enterBy + `</div>
<div>Entered Date : ` + res.enterDate + `</div>
</div>
</div>
<div style="float: right;width: 50%;">
<div style="float: left;width: 49%;">
<div>-------------------------</div>
<div>Checked By :</div>
<div>Checked Date : ` + res.enterDate + `</div>
</div>
<div style="float: right;width: 49%;">
<div>-------------------------</div>
<div>Approved By : ` + res.approveBy + `</div>
<div>Approved Date : ` + res.approveDate + `</div>
</div></div>
</td>
</tr>
        </table> 
        </div>
            <div class="modal-footer print">
                 <input type="button" class="btn btn-primary" style='width:100px;' onclick='excelExport("voucherDataExcel","voucherData")' value='Excel'>
                <input type="button" class="btn btn-primary" style='width:100px;' onclick='printDiv("voucherDataPrint")' value='Print'>
                <input type="button" class="btn btn-danger" style='width:100px;' data-dismiss="modal" value='Close'>
            </div>
        </div>
        </div>`;
            document.getElementById(divId).innerHTML = tableData;
            document.getElementById("voucher-amount-total").innerHTML=totalDr.toFixed(2);
            $("#myModal").modal();
        }
    });
}


function getPurchaseOrder(orderNo, divId, supplier) {
    var URL = path + "/api/Inventory/PurchaseOrder/" + orderNo;
    $.ajax({
        type: "GET",
        url: URL,
        headers: {'Authorization': token},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (res) {
            if (res['error']) {
                messages(res['message']);
                return false;
            }
            var tableData = ` <div class="modal fade" id="myModal" role="dialog" style='height:85%;width:60%;margin:60px auto 0!important;'>
            <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>                    
             </div>
            <div class="modal-body" style="margin:0 auto;" id='voucherDataPrint'>             
            <table class='table table-bordered table-hover table-striped' id='voucherDataExcel'>
                    <tr><td colspan='8' ><b>
                        <div style="text-align: center;font-size: 20px;"> ` + localStorage.getItem("organization-name") + `</div>
                        <div style="text-align: center;font-size: 14px;"> ` + localStorage.getItem("organization-address") + `</div>
              <div style="text-align: center;font-size: 20px;"><b>Purchase Order for ` + supplier + `</b></div>
                         <div><span style="float: left"> Order No :` + res.orderNo + `</span><span style="text-align:center">Order Date : ` + res.enterDate + ` </span> <span style="float: right"> Delivery Date : ` + res.withinDate + `</span></div>
                    </b></td></tr>    
                    <tr><td>SN</td><td>Ac Code</td><td>Ac Name</td><td>Specification</td><td>Quantity</td><td>Rate</td><td>Total</td></tr>`;
            console.log(res);
            var data = res.detail;
//            console.log(data.length);
            console.log(data);
            for (let i = 0; i < data.length; i++) {
                tableData = tableData + `<tr><td>` + (i + 1) + `</td><td>` + data[i].acCode.acCode + `</td><td>` + data[i].acCode.acName + `</td><td>` + data[i].specification + `</td><td>` + data[i].orderQty + `</td><td>` + data[i].rate + `</td><td>` + data[i].total + `</td></tr>`;
            }
            tableData = tableData + `<tr><td colspan='8' style="text-align: left"> Narration : ` + res.narration + `</td></tr>`;
            tableData = tableData + `<tr><td colspan='2' style="text-align: left">
            <div>-------------------------</div>
            <div>Prepared By : ` + res.enterBy + `</div>
            <div>Prepared Date : ` + res.enterDate + `</div>
            </td>
            <td colspan='2' style="text-align: left"> 
            <div>-------------------------</div>
            <div>Approved By : ` + res.approveBy + `</div>
            <div>Approved Date : ` + res.approveDate + `</div></td>
              <td colspan='3' style="text-align: left"> 
            <div>-------------------------</div>
            <div>Verified By : </div>
            <div>Verified Date :  </div></td>

</tr>
        </table> 
        </div>
            <div class="modal-footer print">
                 <input type="button" class="btn btn-primary" style='width:100px;' onclick='excelExport("voucherDataExcel","VoucherData")' value='Excel'>
                <input type="button" class="btn btn-primary" style='width:100px;' onclick='printDiv("voucherDataPrint")' value='Print'>
                <input type="button" class="btn btn-danger" style='width:100px;' data-dismiss="modal" value='Close'>
            </div>
        </div>
        </div>`;
            document.getElementById(divId).innerHTML = tableData;
            $("#myModal").modal();
        }
    });
}