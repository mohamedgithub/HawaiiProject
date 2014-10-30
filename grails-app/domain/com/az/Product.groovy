package com.az

class Product {
    
    String productName
    String description
    Long quantity
    Double costPrice
    Double sellingPrice
    String filename
    String fullPath
    String file

    static constraints = {
        
        productName blank: false, nullable: false, unique: true
        description blank: false, nullable: false
        quantity blank: false, nullable: false
        costPrice blank: false, nullable: false
        sellingPrice blank: false, nullable: false
        filename blank: false, nullable: false
        fullPath blank: false, nullable: false
        file blank: false, nullable: false
    }
    
    static mapping = {
        
      description sqlType:"longtext"
    }
}
