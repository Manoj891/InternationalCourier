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
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
             style="background-color: white;border: 1px solid #c0c0c0;  display: table-cell;padding: 5px 15px 15px !important;box-shadow: 0 0 8px #0a0a0a;">
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
                <label>Destination Country</label>
                <select name='destination' id='destination' class='form-control' required>

                </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <label>Destination (City)</label>
                <input type="text" name="consigneeCity" id="consigneeCity" class="form-control"
                       placeholder="City">
            </div>
            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                <label>Address</label>
                <input type="text" name="consigneeStreet" id="consigneeStreet" class="form-control"
                       placeholder="Address">

            </div>

        </div>

        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12"
             style="background-color: white;border: 1px solid #c0c0c0;  display: table-cell;padding: 5px 15px 15px !important;box-shadow: 0 0 8px #0a0a0a;">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Box No</th>
                    <th>Description</th>
                    <th>Weight</th>
                    <th>Dimension</th>
                    <th>Value</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="6"><input type="button" class="btn btn-primary" value="+" onclick="loadIncreaseBox()">
                    </td>
                </tr>
                </tfoot>
            </table>

            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Total Box</label>
                <input type="number" step="any" id="box" name="box" class="form-control" value="" placeholder="5"
                       required>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Total Weight</label>
                <input type="number" step="any" id="weight" name="weight" class="form-control" value="0.5" required>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <label>Dimension</label>
                <input type="number" step="any" id="dimension" name="dimension" class="form-control" value="0.5"
                       required>
            </div>

            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                <label>&nbsp;</label><br>
                <input type='submit' id="Save" value='Submit' class='btn btn-success'/>
            </div>
        </div>
    </form>
</fieldset>

<script src="<%=path%>/bootstrap/setup/Load.js" type="text/javascript"></script>

<script>
    loadCountry("#destination");
    loadIncreaseBox();

    function loadIncreaseBox() {
        const trid = Math.floor(100000000 + Math.random() * 900000000);
        const boxCount = document.querySelectorAll('.box-no');
        const totalBob = boxCount.length + 1;
        $("#tbody").append(`<tr id="` + trid + `">
                    <td><input type="number" class="form-control box-no" value='` + totalBob + `'></td>
                    <td><input type="number" class="form-control description"></td>
                    <td><input type="number" class="form-control weight"></td>
                    <td><input type="text" class="form-control dimension" onblur="calculation()"></td>
                    <td><input type="text" class="form-control volum"></td>
 <td><input type="button" class="btn btn-primary" value="-" onclick="removeRow('` + trid + `')"></td>
                </tr>`);
        document.getElementById("box").value = totalBob;
    }

    function removeRow(id) {
        const row = document.getElementById(id);
        if (row) {
            row.remove();
        }
        const boxCount = document.querySelectorAll('.box-no');

        boxCount.forEach((box, index) => {
            box.value = index + 1;
        });
        document.getElementById("box").value = boxCount.length + 1
    }

    function calculation() {
        const dimension = document.querySelectorAll('.dimension');
        const volum = document.querySelectorAll('.volum');
        dimension.forEach((d, index) => {
            volum[index].value = Function(`return ` + d.value)();
        });
    }
</script>
<%@include file="../login/footer.jsp" %>