<%@include file="../login/header.jsp" %>
<fieldset style="margin-top: 40px; background-color: #fff8fd !important;">
    <form method='POST' id='dataFrom'>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
             style="background-color: white;border: 1px solid #c0c0c0;  display: table-cell;padding: 5px 15px 15px !important;box-shadow: 0 0 8px #0a0a0a;">
            <div class="row">
                <label>Shipper's</label></div>


            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Name</label>
                <input type="text" id="shipperName" name="shipperName" class="form-control"
                       onkeyup="getShipperName(this.value)" onkeydown="moveFocusInList(event);"
                       onfocus="showList(this.value)" placeholder="Shipper Name" autofocus required>
                <select name="payable" size="5" id='shipperList' style="display: none"
                        onchange="changePossion(this.selectedIndex)"
                        onblur="lostFocus()"></select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Contact Number</label>
                <input type="text" name="shipperContact" id='shipperContact' class="form-control"
                       placeholder="9876543210" required/>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Country</label>
                <input type="text" name="shipperCountry" id="shipperCountry" class="form-control"
                       placeholder="Nepal" value="Nepal" required/>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>City</label>
                <input type="text" name="shipperCity" id="shipperCity" value="" class="form-control" required>
            </div>
            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                <label>Street</label>
                <input type="text" name="shipperStreet" id="shipperStreet" class="form-control"
                       placeholder="Address"/>
            </div>

        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="background-color: white;border: 1px solid #c0c0c0;  display: table-cell;padding: 5px 15px 15px !important;box-shadow: 0 0 8px #0a0a0a;">
            <div class="row">
                <label>Consignee's</label></div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Name</label>
                <input type="text" id="consigneeName" name="consigneeName" class="form-control"
                       placeholder="Consignee Name" required>

            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Contact Number</label>
                <input type="text" name="consigneeContact" id="consigneeContact" class="form-control"
                       placeholder="9876543210" required/>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Country</label>
                <select name='destination' id='destination' class='form-control' required>
                </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Destination (City)</label>
                <input type="text" name="consigneeCity" id="consigneeCity" class="form-control"
                       placeholder="Address">
            </div>
            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                <label>Address</label>
                <input type="text" name="consigneeStreet" id="consigneeStreet" class="form-control"
                       placeholder="Address">

            </div>

        </div>

        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="background-color: white;border: 1px solid #c0c0c0;  display: table-cell;padding: 5px 15px 15px !important;box-shadow: 0 0 8px #0a0a0a;">

            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>T. Mode </label>
                <select name="trMode" id="trMode" class="form-control"
                        required>
                    <option value="R">By Road</option>
                    <option value="A">By Air</option>
                    <option value="S">By Sea</option>
                </select>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Merchandise</label>
                <select name="merchandise" id="merchandise" class="form-control"
                        onblur="getRateByDestination(document.getElementById('destination').value)">
                    <option value="DOX">Document</option>
                    <option value="NON DOX">Non Document</option>
                </select>
            </div>


            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Weight</label>
                <input type="number" step="any" id="weight" name="weight" class="form-control"
                       value="0.5"
                       required>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Pcs</label>
                <input type="number" step="any" name="noOfPcs" id="noOfPcs" value="1" class="form-control" required>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Charge</label>
                <input type="number" step="any" name="charge" id="charge" onkeyup="setGrandTotal()"
                       class="form-control"
                       value="0" required/>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6" hidden="">
                <label>VAT</label>
                <input type="number" step="any" name="vat" id="vat" class="form-control" value="0" readonly/>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Grant Total</label>
                <input type="number" step="any" name="grantTotal" onkeyup="setCharge()" id="grantTotal"
                       class="form-control"
                       required/>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Value Dec</label>
                <input type="text" name="valueDec" id="valueDec" class="form-control">
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label> Special Remarks</label>
                <input type="text" name="remarks" id="remarks" placeholder="Enter Remarks" class="form-control">
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label> BS Date </label>
                <input type="text" name="billDate" id="billDate"
                       value="2083-02-24"
                       class="form-control nepali-datepicker"
                       placeholder="yyyy-MM-dd">
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Goods</label><br>
                <select name="receiveType" id="receiveType" class="form-control">
                    <option value="Pickup">Pickup</option>
                    <option value="Delivery">Delivery</option>
                </select>
            </div>
            <input type="hidden" name="payType" id="payType" value="Cash">
            <input type="hidden" step="any" name="codAmount" id="codAmount" placeholder="Amount"
                   class="form-control" value="0">

            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                <label>&nbsp;</label><br>
                <input type='submit' id="Save" value='Save' class='btn btn-success'/>
            </div>
</fieldset>
</form>

</fieldset>
<%@include file="../login/footer.jsp" %>