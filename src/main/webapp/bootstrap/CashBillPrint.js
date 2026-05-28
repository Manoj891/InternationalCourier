
function printGoodsReceivedNode(billNo, divId)
{
    const URL = path + "/api/Inventory/Ledger/" + billNo;
    $.ajax({type: "GET", url: URL, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
        success: function (res) {
            if (res['error']) {
                messages(res['message']);
                return false;
            }
            console.log(res);
            console.log(res.detail);
            let tableData = ` <div class="modal fade" id="myModal" role="dialog" style='height:85%;width:80%;margin:60px auto 0!important;'>
            <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>                    
             </div>
            <div class="modal-body" style="margin:0 auto;" id='voucherDataPrint'>             
            <table class='table table-bordered table-hover table-striped' id='voucherDataExcel'>
                    <tr><td colspan='8' ><b>
                        <div style="text-align: center;font-size: 20px;"> ` + localStorage.getItem("organization-name") + `</div>
                        <div style="text-align: center;font-size: 14px;"> ` + localStorage.getItem("organization-address") + `</div>
                           <div style="text-align: center;font-size: 20px;"><b>GOODS RECEIVED NOTE</b></div>
                         <div><span style="float: left"> Supplier Name : ` + res.supplierName + ` </span><span style="text-align:center"> Mobile No  : ` + res.supplierContact + ` </span><span style="float: right"> Order No : ` + res.orderNo + `</span></div>
<div><span style="float:left">Supplier Address  : ` + res.supplierAddress + `</span><span style="float:right">Order Date : ` + res.orderDate + `</span></div>
                    </b></td></tr>    
                    <tr><td>SN</td><td>Ac Code</td><td>Ac Name</td><td>Particular</td><td>Quantity</td><td>Rate</td><td>Charge</td><td>Total Amount</td></tr>`;

            let totalAmount = 0;
            const data = res.detail;
            for (let i = 0; i < data.length; i++)
            {
                totalAmount = totalAmount + parseFloat("0" + data[i].totalAmount);
                tableData = tableData + `<tr><td>` + (i + 1) + `</td><td>` + data[i].acCode + `</td><td>` + data[i].acName + `</td><td>` + data[i].particular + `</td><td>` + data[i].qty + ` ` + data[i].unit + `</td><td>` + data[i].rate + `</td><td>` + data[i].vat + `</td><td>` + data[i].totalAmount + `</td></tr>`;
            }
            tableData = tableData + `<tr><td colspan="6"></td><td>Total</td><td> ` + totalAmount + `</td></tr>`;

            tableData = tableData + `<tr><td colspan='8'>
             <div class="row" style="text-align: left;">
             <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Receive By : </div>
            <div>Receive Date : </div>
           </div>
              <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Enter By : ` + res.enterBy + `</div>
            <div>Enter Date : ` + res.enterDate + `</div>
  </div><div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Approve By : ` + res.enterBy + `</div>
            <div>Approve Date : ` + res.enterDate + `</div>
            </div>
            </div>
</td>
</tr>
        </table> 
        </div>
            <div class="modal-footer print">
                 <input type="button" class="btn btn-primary" style='width:100px;' onclick='excelExport("voucherDataExcel","voucherDataExcel")' value='Excel'>
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



function printCashBillReceipt(billNo, divId)
{
    const URL = path + "/api/Billing/CashBill/" + billNo;
    $.ajax({type: "GET", url: URL, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
        success: function (res) {
            if (res['error']) {
                messages(res['message']);
                return false;
            }
            console.log(res);
            console.log(res.detail);
            var tableData = ` <div class="modal fade" id="myModal" role="dialog" style='height:85%;width:80%;margin:60px auto 0!important;'>
            <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>                    
             </div>
            <div class="modal-body" style="margin:0 auto;" id='voucherDataPrint'>             
            <table class='table table-bordered table-hover table-striped' id='voucherDataExcel'>
                    <tr><td><img src="` + path + `Document/Organization/Logo.png" alt="Logo here" class="img-l" draggable="false" height="100" width="100"/>   </td>
<td colspan='4'><b>
                        <div style="text-align: center;font-size: 20px;"> ` + localStorage.getItem("organization-name") + `</div>
                        <div style="text-align: center;font-size: 14px;"> ` + localStorage.getItem("organization-address") + `</div>
                           <div style="text-align: center;font-size: 20px;"><b>CASH BILL</b></div>
                          
<div> <span style="float: left"> ` + res.customerType + ` :  ` + res.customerName + ` </span> <span style="text-align:center"> Mobile No  :  ` + res.mobileNo + `</span><span style="float: right">  Bill No : ` + res.billNo + `</span></div>
</b></td></tr>    
                    <tr><td>SN</td><td>Ac Code</td><td>Ac Name</td><td>Particular</td><td>Amount</td></tr>`;

            var totalAmount = 0;
            var data = res.detail;
            for (let i = 0; i < data.length; i++)
            {
                totalAmount = totalAmount + parseFloat("0" + data[i].amount);
                tableData = tableData + `<tr><td>` + (i + 1) + `</td><td>` + data[i].chartOfAccount.acCode + `</td><td>` + data[i].chartOfAccount.acName + `</td><td>` + data[i].particular + `</td><td>` + data[i].amount + `</td></tr>`;
            }
            tableData = tableData + `<tr><td colspan="2">Pay Type : ` + res.cashTransactionType + `</td>
<td colspan="2">Cheque/Transaction No : ` + res.cashTransactionNo + `</td><td>Total ` + totalAmount + `</td></tr>`;

            tableData = tableData + `<tr><td colspan='5'>
             <div class="row" style="text-align: left;">
             <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Receive By : </div>
            <div>Receive Date : </div>
           </div>
              <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Enter By : ` + res.enterBy + `</div>
            <div>Enter Date : ` + res.enterDate + `</div>
  </div><div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
            <div>-------------------------</div>
            <div>Approve By : ` + res.approveBy + `</div>
            <div>Approve Date : ` + res.approveDate + `</div>
            </div>
            </div>
</td>
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
