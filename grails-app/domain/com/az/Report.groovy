package com.az

class Report {
    
    String productName
    Double sellingPrice
    int quantity
    Double profit
    Double total
    Date date

    static constraints = {
        productName blank:false,nullable:false
        sellingPrice blank:false,nullable:false
        quantity blank:false,nullable:false
        profit blank:false,nullable:false
        total blank:false,nullable:false
        date blank:true,nullable:true
    }
}
