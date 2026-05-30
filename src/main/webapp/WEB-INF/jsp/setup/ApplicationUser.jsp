<%@include file="../login/header.jsp" %>

<fieldset style="margin-top: 40px;">
    <legend>Application User</legend>

    <form id="dataFrom" onsubmit="return doSave()">

        <input type="hidden" name="id" id="id">
        <div class="row">
            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <label>Username</label>
                <input type="text" name="username" id="username" class="form-control">
            </div>
            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <label>Email</label>
                <input type="email" name="email" id="email" class="form-control">
            </div>

            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <label>Mobile No</label>
                <input type="text" name="mobileNo" id="mobileNo" maxlength="10" class="form-control">
            </div>
            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <label>User Type</label>
                <select name="usertype" id="usertype" class="form-control">
                    <option value="ADM">ADMIN</option>
                    <option value="USR">USER</option>
                </select>

            </div>
            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <label>Branch</label>
                <select name="branch" id="branch" class="form-control">
                    <option value="">Select Branch</option>
                </select>
            </div>

            <div class="col-lg-3 col-sm-3 col-md-3 col-xs-6">
                <br>
                <label>&nbsp;</label>
                <button type="submit" class="btn btn-primary">
                    Save
                </button>
            </div>

        </div>

    </form>

    <hr>

    <div id="table"></div>

</fieldset>
<script src="<%=path%>/bootstrap/setup/ApplicationUser.js" type="text/javascript"></script>
<%@include file="../login/footer.jsp" %>