<%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>   
<script type='text/javascript'>
    $(document).ready(
    function(){
        $('#imgButton').attr('disabled',true);
        $('input:file').change(
            function(){
                if ($("#myFile").val() ){
                    $('#imgButton').removeAttr('disabled'); 
                }
                else {
                    $('#imgButton').attr('disabled',true);
                }
        });
    });
</script> 
    </head>
    <body>
                <div class="container container-top" ng-controller="EditController">
                    <div ng-hide="hide">{{products.id}}
                    </div>
                    <form name="myUpload" class="form-horizontal status" ng-submit="update()" method="POST" autocomplete='off'>
                        <div class="row">  
                            <div class="alert alert-success" data-ng-show="success" role="alert">{{success}}</div>
                        </div>
                        <div ng-hide="id"><input type="hidden" name="productId" ng-model="products.id" class="form-control" required=""/></div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">Product Name:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" required="" name="productName" placeholder="Product Name" ng-model="products.productName">
                                <span class="text-danger">{{productNameError}}</span>
                            </div>
                        </div>

                        <div class="form-group">
                          <label  class="col-sm-3 control-label">Description:</label>
                            <div class="col-sm-4">
                                <textarea class="form-control" name="description" required="" rows="3" cols="30" placeholder="Description" ng-model="products.description"> </textarea>
                            </div>
                        </div>

                        <div class="form-group">
                          <label  class="col-sm-3 control-label">Cost Price:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="costPrice" required="" placeholder="Cost Price" ng-model="products.costPrice">
                                <span class="text-danger">{{costFormatError}}</span>
                            </div>
                        </div>
                            
                        <div class="form-group">
                          <label  class="col-sm-3 control-label">Selling Price:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="selling" name="sellingPrice" required="" placeholder="Selling Price" ng-model="products.sellingPrice">
                                <span class="text-danger">{{costError}}</span>
                                <span class="text-danger">{{sellFormatError}}</span>
                            </div>
                        </div>

                        <div class="form-group">
                          <label  class="col-sm-3 control-label">Quantity:</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" name="quantity" id="quantity" required="" placeholder="Quantity" ng-model="products.quantity" >
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-6 col-md-offset-6">
                                <button type="submit" class="btn btn-primary my-btn-style">Update</button>
                            </div>
                        </div>
                            
                        <div class="myrow">
                            <img src="images/{{products.filename}}" alt="" class="img80_80"/>
                        </div>
                            
                        <div class="form-group">
                          <label  class="col-sm-3 control-label">Image upload :</label>
                            <div class="col-sm-4">
                                <input type="file" class="upload" ng-model="productImage" name="myFile" id="myFile" ng-file-select="onFileSelect($files)" multiple />
                            </div>
                        </div> 
                        
                        <div class="form-group">
                            <div class="col-sm-6 col-md-offset-6">
                                <button type="" class="btn btn-primary my-update-left" id="imgButton" ng-click="upload()">Upload</button>
                            </div>
                        </div>
                            
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
