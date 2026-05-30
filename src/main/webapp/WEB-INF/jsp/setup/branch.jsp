<%@include file="../login/header.jsp" %>
<fieldset style="margin-top: 40px;">
    <legend>Branch</legend>
    <form id="dataFrom" onsubmit="return doSave()">
        <div class="row">
            <input type="hidden" name="id" id="id">
            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Branch Name</label>
                <input type="text" name="name" id="name" class="form-control">
            </div>
            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Code</label>
                <input type="text" name="code" id="code" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Address</label>
                <input type="text" name="address" id="address" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Contact No</label>
                <input type="text" name="contactNo" id="contactNo" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <label>Email</label>
                <input type="email" name="email" id="email" class="form-control">
            </div>

            <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
                <br>
                <label>&nbsp;</label>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
    </form>
    <hr>
    <div id="table" style="margin-top: 30px"></div>
</fieldset>
<script src="<%=path%>/bootstrap/setup/branch.js" type="text/javascript"></script>
<%@include file="../login/footer.jsp" %>