<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
        <title>Web Application</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <!-- needs images, font... therefore can not be part of ui.css -->

            <asset:stylesheet src="main.css"/>

    </head>
    <body data-custom-background data-off-canvas-nav="">
        <!--[if lte IE 9]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

                    <div class="page-signin">

    <div class="signin-header">
        <div class="container text-center">
            <section class="logo">
                <a href="#/">Capataz</a>
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
                                <input type="password" class="form-control" placeholder="Password" name='j_password' id='password'>
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
                    <p class="text-center"><a href="forgot-password.html">Forgot your password?</a></p>
                    <p class="text-center text-muted text-small">Don't have an account yet? <a href="signup.html">Sign up</a></p>
                </section>
                
            </div>
        </div>
    </div>

</div>


        <script src="bower_components/jquery/dist/jquery.min.js"></script>
    </body>
</html>