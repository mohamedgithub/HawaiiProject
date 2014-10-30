<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
        <title>Web Application</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <asset:stylesheet src="main.css"/>
    </head>
    <body data-custom-background data-off-canvas-nav="">
        <div class="page-signin">
            <div class="signin-header">
                <div class="container text-center">
                    <section class="logo">
                        <a href="#/">Hawaii</a>
                    </section>
                </div>
            </div>
            <div class="signin-body">
                <div class="container">
                    <div class="form-container">
                        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                            <fieldset>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-user"></span>
                                        </span>
                                        <input type="text"class="form-control text_" name='j_username' id='username' placeholder="Username" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-lock"></span>
                                        </span>
                                        <input type="password" class="form-control" placeholder="Password" name='j_password' id='password' required>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                                <div class="form-group">
                                    <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block">Log in</button>
                                </div>
                            </fieldset>
                        </form>
                        <section>
                            <p class="text-center"><g:link controller="test" action="forgotPassword">Forgot Password ?</g:link></p>
                            <p class="text-center text-muted text-small">Don't have an account yet?&nbsp; <g:link controller="test" action="signUpUser">Sign Up</g:link></p>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>