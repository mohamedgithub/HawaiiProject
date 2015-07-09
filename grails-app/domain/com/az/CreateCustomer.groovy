package com.az

class CreateCustomer {
    
    	static hasMany = [payment : Payment]

    
    String customerName
    int amount
    int interest
    String customerPhoneNumber
    String customerAddress
    String guarantorName
    String guarantorPhoneNumber
    String guarantorAddress
    
    
    static constraints = {
        customerName blank: true,nullable: true
        amount blank: true,nullable: true
        interest blank: true,nullable: true
        customerPhoneNumber blank: true,nullable: true
        customerAddress blank: true,nullable: true
        guarantorName blank: true,nullable: true
        guarantorPhoneNumber blank: true,nullable: true
        guarantorAddress blank: true,nullable: true 
    }
}
