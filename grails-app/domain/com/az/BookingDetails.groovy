package com.az

class BookingDetails {
    
    String roomType
    String view
    String seasonType
    String bookingDays
    Double costPrice
    Double weekendCostPrice
    
    static constraints = {
        roomType blank: true,nullable: true
        view blank: true,nullable: true
        seasonType blank: true,nullable: true
        bookingDays blank: true,nullable: true
        costPrice blank: true,nullable: true
        weekendCostPrice blank: true,nullable: true 
    }
     
}
