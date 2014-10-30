<%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <asset:stylesheet src="main.css"/>
    </head>
    <body>
        <div class="row my-row-top" style="margin-left: 5px;margin-right: 30px;" ng-controller="ListCtrl">
                <a href="#/app/create"  class="pull-right">
                    <button class="btn btn-primary">Add Product</button>
                </a>
            <table table class=" table table-hover table table-bordered  table table-striped" > 
                <tr>
                   <th class="primary">Product Name</th>
                   <th class="primary">Description</th>
                   <th class="primary">Cost Price</th>
                   <th class="primary">Selling Price</th>
                   <th class="primary">Quantity</th>
                   <th class="primary">File Name</th>
                   <th class="primary">Action</th>
                </tr>
                <tr ng-repeat="product in products">
                    <td>{{product.productName}}</td> 
                    <td>{{product.description}}</td>
                    <td>{{product.costPrice}}</td>
                    <td>{{product.sellingPrice}}</td>
                    <td>{{product.quantity}}</td>
                    <td><img src="images/{{product.filename}}" alt="" class="img80_80"/></td>
                    <td><button type="button" class="btn btn-primary btn-default" style="margin-left: 10px;" ng-click="deleteProduct($index)">Delete</button>
                    <button type="button" class="btn btn-primary btn-default" style="margin-left: 20px;" ng-click=" editProduct($index)">Edit</button></a></td>
                </tr>
            </table>  
        </div>
    </body>
</html>
