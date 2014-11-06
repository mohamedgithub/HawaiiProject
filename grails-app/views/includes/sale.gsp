
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale Product</title>
    </head>
    <body >
        <div class="container" ng-controller="ListCtrl">  
            <h1 class="stack stack-section-title">Products</h1>
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"ng-repeat="product in products">
                        <div class="thumbnail">
                            <img src="images/{{product.filename}}" alt="" style="width:250px;height:160px"/>
                            <div class="caption">
                                <h5><center> Product Name:&nbsp;{{product.productName}}</center></h5>
                                <h5><center> Price:&nbsp;{{product.sellingPrice}}&nbsp;INR </center></h5>
                                <button class="btn btn-primary btn-right" ng-click="buyProduct($index)">Buy Product</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </body>
</html>
