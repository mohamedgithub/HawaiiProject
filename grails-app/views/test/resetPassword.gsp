<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    <asset:stylesheet src="main.css"/>
</head>
<body>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Reset password</h3>
        </div>
        <div class="panel-body">
            <g:form url="[action:'savePassword',controller:'test']" class="form-horizontal" autocomplete='off'>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Access ID</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="token" placeholder="Token" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">New Password</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="newPassword" placeholder="Enter your password" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Confirm Password</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="confirmPassword" placeholder="Enter your confirmPassword" required="">
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
