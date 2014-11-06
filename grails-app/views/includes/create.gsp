<html>
    <head>
        <title>Product Creation</title>
    </head>
    <body>
        <div class="container" ng-cloak ng-controller="AddProductController">
            <h1 class="row-list"> Create Product</h1>
                    
                        <form name="myUpload" class="form-horizontal status" ng-submit="save()" method="POST" autocomplete='off'>
                            <div class="custom-row">  
                                <div class="alert alert-success" data-ng-show="success" role="alert">{{success}}</div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-3 control-label">Product Name:</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="productName" data-ng-model="product.productName"  required="" placeholder="Product Name">
                                    <span class="text-danger">{{productNameError}}</span>
                                </div>
                            </div>
                           
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Description:</label>
                                <div class="col-sm-4">
                                    <textarea class="form-control" name="description" data-ng-model="product.description" required="" rows="3" cols="30" placeholder="Description"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Cost Price:</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="costPrice" data-ng-model="product.costPrice"  required="" placeholder="Cost Price" >
                                    <span class="text-danger">{{costFormatError}}</span>
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Selling Price:</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="sellingPrice" required="" data-ng-model="product.sellingPrice" placeholder="Selling Price"> 
                                    <span class="text-danger">{{costError}}</span>
                                    <span class="text-danger">{{sellFormatError}}</span>
                                </div>
                            </div>

                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Quantity:</label>
                                <div class="col-sm-4">
                                    <input type="number" class="form-control" name="quantity" data-ng-model="product.quantity" required="" placeholder="Quantity">
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Image upload :</label>
                                <div class="col-sm-4">
                                    <input type="file" class="upload" name="myFile" ng-file-select="onFileSelect($files)" multiple/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-5 col-sm-7">
                                    <button type="submit" class="button-left btn btn-primary">Submit</button>
                                </div>
                            </div>
                         </form>
                    </div>

    </body>
</html>

