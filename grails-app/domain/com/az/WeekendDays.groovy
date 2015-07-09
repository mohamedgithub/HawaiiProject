package com.az

class WeekendDays {
    
    Date weekendDays
    BookingDetails bookingDetails
    
    static constraints = {
        
        weekendDays blank: true,nullable: true
    }
}
