package com.az

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ProductController {
   
    def save() {
        def requestData = params
        def product = new Product()
        def findName = Product.findByProductName(requestData.productName);
        if(findName) {
            render "Product already Exist";
        } else {
            if(requestData.costPrice.toDouble() <= requestData.sellingPrice.toDouble()) {
                product.productName = requestData.productName
                product.description = requestData.description
                product.costPrice = requestData.costPrice.toDouble()
                product.sellingPrice = requestData.sellingPrice.toDouble()
                product.quantity = requestData.quantity.toInteger();
                def file = request.getFile("myFile")
                product.filename = file.originalFilename
                product.fullPath = grailsApplication.config.uploadFolder + product.filename
                file.transferTo(new File(product.fullPath))
                product.file = file
                product.save(flush:true)
                render 'Your product added successfully'
                
            } else {
                render "Selling price must be greater then cost price"; 
            }
        }
    }
    
    def editProduct() {
        def requestData = request.JSON
        def product = Product.findById(requestData.productDetails.id)
        render product as JSON  
    }
    
    def list() {
        render Product.findAll() as JSON 
    }
        
    def deleteProduct() {
        def requestData = request.JSON
        def product = Product.findById(requestData.productDetails.id)
        product.delete(flush: true)
        render "deleted"
    }
    
    def update() {
        
        def requestData = request.JSON
        def product = Product.findById(requestData.productId.id)
        def findName = Product.findByProductName(requestData.productId.productName);
        if(product.productName == requestData.productId.productName) {
            if(requestData.productId.costPrice.toDouble() <= requestData.productId.sellingPrice.toDouble()) {      
                product.productName = requestData.productId.productName
                product.description = requestData.productId.description
                product.costPrice = requestData.productId.costPrice.toDouble()
                product.sellingPrice = requestData.productId.sellingPrice.toDouble()
                product.quantity = requestData.productId.quantity.toInteger();
                product.save(flush:true)
                render 'Product updated successfully'
            } else {
                render "Selling price must be greater then cost price";
            }  
        } else if(findName) {
            render "Product already Exist"
        } else {
            if(requestData.productId.costPrice.toDouble() <= requestData.productId.sellingPrice.toDouble()) {
                product.productName = requestData.productId.productName
                product.description = requestData.productId.description
                product.costPrice = requestData.productId.costPrice.toDouble()
                product.sellingPrice = requestData.productId.sellingPrice.toDouble()
                product.quantity = requestData.productId.quantity.toInteger();
                product.save(flush:true)
                render 'Product updated successfully'
            } else {
                render "Selling price must be greater then cost price";
            } 
        }
    }    
    
    def upload() {
        def requestData = params
        def file = request.getFile("myFile")
        def product = Product.findById(requestData.id)
        product.filename = file.originalFilename
        product.fullPath = grailsApplication.config.uploadFolder + product.filename
        file.transferTo(new File(product.fullPath))
        product.file = file
        product.save(flush:true)
        render 'file updated successfully' 
    }
    
    def getProduct() {
        def product = Product.findAll()
        render product as JSON
    }
    
    def buyProduct() {
        def requestData = request.JSON
        def product = Product.findById(requestData.productDetails.id)
        render product as JSON
    }
    
    def checkOrder() {
        
        def requestData = request.JSON
        def requestUserData = request.JSON
        def product = Product.findById(requestData.productDetails.id)
        if(requestUserData.user <= product.quantity) {
            def currentQuantity = product.quantity
            product.quantity = (currentQuantity - requestUserData.user)
            product.save(flush:true)
            def report = new Report()
            report.productName = product.productName
            report.sellingPrice = product.sellingPrice
            report.quantity =  requestUserData.user
            report.profit =  ((product.sellingPrice - product.costPrice) * requestUserData.user)
            report.total = (product.sellingPrice * requestUserData.user)
            def date = new Date()
            report.date = date
            report.save(flush:true)
            render "Your purchase has been done successfully"
        } else {
            render("Only" + product.quantity + " Products available")
        }
    }
    
    def getReport() {
        def report = Report.findAll()
        render report as JSON
    }
    def getProfit() {
        def report = Report.findAll()
        def totalProfit = 0;
        for (def profit : report.profit) { 
            totalProfit = totalProfit + profit;
        }
        render totalProfit
    }
}
