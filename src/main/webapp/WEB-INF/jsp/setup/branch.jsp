<%@include file="../login/header.jsp" %>
<fieldset style="margin-top: 100px;padding-right: 50px">
    <legend>Branch</legend>

<form  method="post">
<div class="row">

        <input type="hidden" name="id" id="id">

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <label>Branch Name</label>
        <input type="text" name="name" id="name" class="form-control" >
    </div>

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <label>Code</label>
        <input type="text" name="code" id="code" class="form-control" >
    </div>

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <label>Address</label>
        <input type="text" name="address" id="address" class="form-control" >
    </div>

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <label>Contact No</label>
        <input type="text" name="contactNo" id="contactNo" class="form-control" >
    </div>

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <label>Email</label>
        <input type="email" name="email" id="email" class="form-control" >
    </div>

    <div class='col-lg-3 col-sm-3 col-md-3 col-xs-6'>
        <br>
        <label>&nbsp;</label>
        <button type="submit" class="btn btn-primary">Save</button>
    </div>
</div>
</form>
</fieldset>
<%@include file="../login/footer.jsp" %>