package com.az

class SeasonTimes {

    String seasonType
    Date startdate
    Date enddate
    
    static constraints = {
        seasonType blank: true,nullable: true
        startdate blank: true,nullable: true
        enddate blank: true,nullable: true
    }
}
