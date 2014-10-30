<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
    <asset:stylesheet src="main.css"/>
</head>
<body>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Forgot password</h3>
        </div>
        <div class="panel-body">
            <g:form url="[action:'checkName',controller:'test']" class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-5">
                        <input type="email" class="form-control" name="email" placeholder="Enter your Email" required="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3 col-md-offset-5">
                            <g:submitButton class="btn btn-primary" name="Submit" value="Submit" />
                            <g:link><a href="http://localhost:8080/Hawaii/login/auth"><input type="button" value="Back" class="btn btn-primary"/> </a></g:link>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</body>
</html>
