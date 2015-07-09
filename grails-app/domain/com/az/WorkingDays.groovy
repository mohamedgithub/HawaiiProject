package com.az

class WorkingDays {
    
    Date workingDays
    BookingDetails bookingDetails
    
    static constraints = {
        
        workingDays blank: true,nullable: true
    }
}
