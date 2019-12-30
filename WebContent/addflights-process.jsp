<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Info</title>
</head>
<body>

<form method="post" action="addflights2.jsp" onSubmit="return validateForm();">
<div style="width: 400px;">
</div>
<div style="padding-bottom: 18px;font-size : 24px;">Adding Flights</div>
<div style="display: flex; padding-bottom: 18px;width : 450px;">

<div style=" margin-left : 1%; margin-right : 0; width : 49%;">Flight Type<span style="color: red;"> *</span><br/>
<input type="text" id="data_3" name="data_3" style="width: 100%;" class="form-control"/>
</div>
</div><div style="padding-bottom: 18px;">Trip Options<span style="color: red;"> *</span><br/>
<input type="text" id="data_4" name="data_4" style="width : 450px;" class="form-control"/>
</div>
<div style="padding-bottom: 18px;">Cost<span style="color: red;"> *</span><br/>
<input type="text" id="data_5" name="data_5" style="width : 450px;" class="form-control"/>
</div>
<div style="padding-bottom: 18px;">Departure<span style="color: red;"> *</span><br/>
<input type="text" id="data_6" name="data_6" style="width : 250px;" class="form-control"/>
</div>


<div style="padding-bottom: 18px;">Arrival<span style="color: red;"> *</span><br/>
<input type="text" id="data_7" name="data_7" style="width : 250px;" class="form-control"/>
</div>

<div style="padding-bottom: 18px;">Number of Stops<span style="color: red;"> *</span><br/>
<input type="text" id="data_8" name="data_8" style="width : 250px;" class="form-control"/>
</div>

<div style="padding-bottom: 18px;"><input name="skip_Submit" value="Add" type="submit"/></div>

</form>


</body>
</html>