package com.az

class Payment {
    
    static belongsTo = CreateCustomer
    
    Date date
    CreateCustomer createCustomer
    int amount
    int interest
    int paid
    int outstanding
    int payingAmount

    static constraints = {
        date blank: true,nullable: true
        createCustomer blank: true,nullable: true
        amount blank: true,nullable: true
        interest blank: true,nullable: true
        paid blank: true,nullable: true
        outstanding blank: true,nullable: true
        payingAmount blank: true,nullable: true
    }
}
