

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product buy</title>
    </head>
    <body>
        <h1 class="row-list"> Product Sale</h1>
        
        <div class="container" ng-controller="BuyCtrl">
            <div class="custom-row">  
                <div class="alert alert-success" data-ng-show="success" role="alert">{{success}}</div>
            </div>
            
            <form name="myform" class="form-horizontal status" ng-submit="checkOrder()" method="POST" autocomplete='off'>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                        <table table class=" table table-hover table table-bordered  table table-striped" > 
                            <tr>
                               <th class="primary">Product Name</th>
                               <th class="primary">Availability</th>
                               <th class="primary">Cost Price</th>
                               <th class="primary">Selling Price</th>
                               <th class="primary">Quantity</th>
                               <th class="primary">Total</th>
                               <th class="primary">Action</th>
                            </tr>
                            <tr>
                                <td>{{product.productName}}</td> 
                                <td>{{product.quantity}}</td>
                                <td>{{product.costPrice}}</td>
                                <td>{{product.sellingPrice}}</td>
                                <td><center><input type="number" class="form-control" name="quantity" min="1" max="{{product.quantity}}" ng-model="user.quantity" style="width: 150px" name="userOrder" required=""></center></td>
                                <td>{{product.sellingPrice * user.quantity}}</td>
                                <td><button type="" class="btn btn-primary btn-default" style="margin-left: 10px;">Add</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
           </form>  
        </div> 
    </body>
</html>
