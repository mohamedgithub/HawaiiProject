package com.az

import grails.converters.JSON
import java.text.DateFormat

import java.text.ParseException;
import java.text.SimpleDateFormat
import org.springframework.security.access.annotation.Secured
import java.util.Date;
import java.util.Calendar;

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
    
    def getDetails() {
        
        HashMap items = new HashMap()
        def roomTypes = RoomTypes.findAll()
        items.put("roomTypes", roomTypes)
        def views = Views.findAll()
        items.put("views", views)
        def seasonTimes = SeasonTimes.findAll()
        items.put("seasonTimes", seasonTimes)
        def days = Days.findAll()
        items.put("days", days)
        render items as JSON
    }
    
    def roomSave() {
        
        def requestData = request.JSON
        HashMap fieldError = new HashMap()
        HashMap items = new HashMap()
        if(!requestData.saveRoomDetails.roomType ||  !requestData.saveRoomDetails.viewType || !requestData.saveRoomDetails.seasonType || !requestData.saveRoomDetails.bookingDay) {
        
            if(!requestData.saveRoomDetails.roomType) {
                items.put("roomTypeError", "Select room type")
            }
            if(!requestData.saveRoomDetails.viewType) {
                items.put("viewTypeError", "Select view type")  
            }
            if(!requestData.saveRoomDetails.seasonType) {
                items.put("seasonTypeError", "Select season type")
            }
            if(!requestData.saveRoomDetails.bookingDay) {
                items.put("bookingDayError", "Select booking day") 
            }
            
            fieldError.put("error", items)
            render fieldError as JSON
        }
        else {
            def bookingDetails = new BookingDetails()
            Date currentDate = new Date()
            List selectedDays = new ArrayList();
            
            def findRoom = BookingDetails.findByRoomTypeAndViewAndSeasonTypeAndBookingDays(requestData.saveRoomDetails.roomType, requestData.saveRoomDetails.viewType, requestData.saveRoomDetails.seasonType, requestData.saveRoomDetails.bookingDay) 
            if(findRoom) {
                render("Exist")
            } else {
                def season = SeasonTimes.findBySeasonType(requestData.saveRoomDetails.seasonType)
                Calendar startCal = Calendar.getInstance();
                startCal.setTime(season.startdate);
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(season.enddate);
                while (startCal.getTimeInMillis() < endCal.getTimeInMillis()) {
                    startCal.add(Calendar.DAY_OF_MONTH, 1);
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                        if(requestData.saveRoomDetails.sunday == 'SUNDAY') {
                            selectedDays.add(Calendar.SUNDAY)  
                        }
                    }   
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
                        if(requestData.saveRoomDetails.monday == 'MONDAY') {
                            selectedDays.add(Calendar.MONDAY)  
                        }
                    }
                
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY) {
                        if(requestData.saveRoomDetails.tuesday == 'TUESDAY') {
                            selectedDays.add(Calendar.TUESDAY) 
                        }
                    }
                
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.WEDNESDAY) {
                        if(requestData.saveRoomDetails.wednesday == 'WEDNESDAY') {
                            selectedDays.add(Calendar.WEDNESDAY) 
                        }
                    }
                
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.THURSDAY) {
                        if(requestData.saveRoomDetails.thursday == 'THURSDAY') {
                            selectedDays.add(Calendar.THURSDAY) 
                        }
                    }
                
                    if (startCal.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY) {
                        if(requestData.saveRoomDetails.friday == 'FRIDAY') {
                            selectedDays.add(Calendar.FRIDAY) 
                            
                        }
                    }
                
                    if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                        if(requestData.saveRoomDetails.saturday == 'SATURDAY') {
                            selectedDays.add(Calendar.SATURDAY) 
                        }
                    }  
                }
                Calendar startCalendar = Calendar.getInstance();
                startCalendar.setTime(season.startdate);
                Calendar endCalendar = Calendar.getInstance();
                endCalendar.setTime(season.enddate);
                
                long DAY_IN_MILLIS = 1000 * 60 * 60 * 24;
                int diffInDays = (int) ((season.enddate.getTime() - season.startdate.getTime())/ DAY_IN_MILLIS );
                
                bookingDetails.roomType = requestData.saveRoomDetails.roomType
                bookingDetails.view = requestData.saveRoomDetails.viewType
                bookingDetails.seasonType = SeasonTimes.findBySeasonType(requestData.saveRoomDetails.seasonType)?.id
                bookingDetails.bookingDays = requestData.saveRoomDetails.bookingDay
                bookingDetails.costPrice = requestData.saveRoomDetails.roomPrice.toDouble()
                bookingDetails.weekendCostPrice = requestData.saveRoomDetails.weekendroomPrice.toDouble()
                bookingDetails.save(flush:true)
                for(int i=0; i<=diffInDays; i++) {
                    currentDate = startCalendar.getTime();
                    int day = startCalendar.get(Calendar.DAY_OF_WEEK)
                    if(selectedDays.contains(day)) {
                        def weekendDays = new WeekendDays()
                        weekendDays.bookingDetails = bookingDetails
                        weekendDays.weekendDays = currentDate
                        weekendDays.save()
                    } else {
                        def workingDays = new WorkingDays()
                        workingDays.workingDays = currentDate
                        workingDays.bookingDetails = bookingDetails
                        workingDays.save()
                    } 
                    startCalendar.add(Calendar.DATE, 1);
                    currentDate = startCal.getTime();
                }
                render 'Success'
            }
        }
    }     
    def deleteSeason() {
        def requestData = request.JSON
        def season = SeasonTimes.findById(requestData.deleteId.id)
        season.delete(flush: true)
        render "deleted"
    }
    
    def editSeason() {
        def requestData = request.JSON
        def season = SeasonTimes.findById(requestData.editId.id)
        render season as JSON
    }
    
    
    def getRoomDetails() {
        
        def weekendDays = WeekendDays.findAll()
        def workingDays = WorkingDays.findAll()
        def bookingDetails = BookingDetails.findAll()?.id
        List items = new ArrayList()
        for (bookingDetailId in bookingDetails) {
            def Id = BookingDetails.findById(bookingDetailId)
            Console.print(Id.seasonType)
            def findSeasonType = SeasonTimes.findById(Id.seasonType)
            def week = WeekendDays.findAllByBookingDetails(Id)
            def work = WorkingDays.findAllByBookingDetails(Id)
            HashMap hash = new HashMap()
            hash.put('Id', Id.id)
            hash.put("roomType", Id.roomType)
            hash.put("view", Id.view)
            hash.put("seasonType", findSeasonType.seasonType)
            hash.put("bookingDays", Id.bookingDays)
            hash.put("costPrice", Id.costPrice)
            hash.put("weekendCostPrice", Id.weekendCostPrice)
            hash.put("weekendDays", week.weekendDays)
            hash.put("workingDays", work.workingDays)
            items.add(hash)
        }
        Console.print(items as JSON)
        render items as JSON
    }
    
    def deleteRoom() {
        def requestData = request.JSON
        def bookingDetails = BookingDetails.findById(requestData.deleteId.id)
        bookingDetails.delete(flush: true)
        render "deleted"
    }
    
    def editRoom() {
        
        def requestData = request.JSON
        def bookingDetails = BookingDetails.findById(requestData.editId.id)
        render bookingDetails as JSON
    }
    
    def saveSeason() {
        
        def requestData = request.JSON
        def season = new SeasonTimes()
        SimpleDateFormat formatter
        formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date startDate = formatter.parse(requestData.startDate);
        Date endDate = formatter.parse(requestData.endDate);
        def findName = SeasonTimes.findBySeasonType(requestData.saveSeasonDetails.name)
        if(findName) {
            render"Exist"
        } else {
            season.seasonType = requestData.saveSeasonDetails.name
            season.startdate =  startDate
            season.enddate = endDate
            season.sunday = requestData.saveSeasonDetails.sunday
            season.monday = requestData.saveSeasonDetails.monday
            season.tuesday = requestData.saveSeasonDetails.tuesday
            season.wednesday = requestData.saveSeasonDetails.wednesday
            season.thursday = requestData.saveSeasonDetails.thursday
            season.friday = requestData.saveSeasonDetails.friday
            season.saturday = requestData.saveSeasonDetails.saturday
            season.bookingDays = requestData.saveSeasonDetails.bookingDays
            season.save()
            render 'Success'
        }
    }
    
    def updateSeason() {
        
        def requestData = request.JSON
        def season = SeasonTimes.findById(requestData.saveSeasonDetails.id)
        SimpleDateFormat formatter
        formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date startDate = formatter.parse(requestData.startDate);
        Date endDate = formatter.parse(requestData.endDate);
        def findSeason = SeasonTimes.findBySeasonType(requestData.saveSeasonDetails.name)
        if(season.seasonType == requestData.saveSeasonDetails.name ) {
            season.startdate =  startDate
            season.enddate = endDate
            season.save()
            render 'Updated'
        }else if(findSeason) {
            render "Season Exist"
        } else {
            season.seasonType = requestData.saveSeasonDetails.name
            season.startdate =  startDate
            season.enddate = endDate
            season.save()
            render 'Updated'
        }
    }
    
    def getSeasonDetails() {
        
        def seasonDetails = SeasonTimes.findAll()
        render seasonDetails as JSON
    }
    
    def updateRoom() {
        
        def requestData = request.JSON
        def bookingDetails = BookingDetails.findById(requestData.saveRoomDetails.id)
        if(bookingDetails.roomType == requestData.saveRoomDetails.roomType && bookingDetails.view == requestData.saveRoomDetails.viewType && bookingDetails.seasonType == requestData.saveRoomDetails.seasonType && bookingDetails.bookingDays == requestData.saveRoomDetails.bookingDay) {
            bookingDetails.costPrice = requestData.saveRoomDetails.costPrice.toDouble()
            bookingDetails.save()
            render 'Success'
        } else { 
            def findRoom = BookingDetails.findByRoomTypeAndViewAndSeasonTypeAndBookingDays(requestData.saveRoomDetails.roomType, requestData.saveRoomDetails.viewType, requestData.saveRoomDetails.seasonType, requestData.saveRoomDetails.bookingDay) 
            if(findRoom) {
                render("Exist")
            } else {
                Date currentDate = new Date()
                List selectedDays = new ArrayList();
                
                def season = SeasonTimes.findBySeasonType(requestData.saveRoomDetails.seasonType)
                Calendar startCal = Calendar.getInstance();
                startCal.setTime(season.startdate);
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(season.enddate);
                while (startCal.getTimeInMillis() < endCal.getTimeInMillis()) {
                    startCal.add(Calendar.DAY_OF_MONTH, 1);
                    if (requestData.saveRoomDetails.sunday == 'SUNDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                            bookingDetails.sunday = Calendar.SUNDAY 
                        }
                    }   
                    if (requestData.saveRoomDetails.monday == 'MONDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
                            bookingDetails.monday = Calendar.MONDAY
                        }
                    }
                
                    if (requestData.saveRoomDetails.tuesday == 'TUESDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY) {
                            bookingDetails.tuesday = Calendar.TUESDAY 
                        }
                    }
                
                    if (requestData.saveRoomDetails.wednesday == 'WEDNESDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.WEDNESDAY) {
                            bookingDetails.wednesday = Calendar.WEDNESDAY 
                        }
                    }
                
                    if (requestData.saveRoomDetails.thursday == 'THURSDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.THURSDAY) {
                            bookingDetails.thursday = Calendar.THURSDAY 
                        }
                    }
                
                    if (requestData.saveRoomDetails.friday == 'FRIDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY) {
                            bookingDetails.friday = Calendar.FRIDAY 
                            
                        }
                    }
                
                    if(requestData.saveRoomDetails.saturday == 'SATURDAY') {
                        if(startCal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                            bookingDetails.saturday = Calendar.SATURDAY 
                        }
                    }  
                }
                
                selectedDays.add(bookingDetails.sunday)
                selectedDays.add(bookingDetails.monday)
                selectedDays.add(bookingDetails.tuesday)
                selectedDays.add(bookingDetails.wednesday)
                selectedDays.add(bookingDetails.thursday)
                selectedDays.add(bookingDetails.friday)
                selectedDays.add(bookingDetails.saturday)
                
                Calendar startCalendar = Calendar.getInstance();
                startCalendar.setTime(season.startdate);
                Calendar endCalendar = Calendar.getInstance();
                endCalendar.setTime(season.enddate);
                
                long DAY_IN_MILLIS = 1000 * 60 * 60 * 24;
                int diffInDays = (int) ((season.enddate.getTime() - season.startdate.getTime())/ DAY_IN_MILLIS );
                
                bookingDetails.roomType = requestData.saveRoomDetails.roomType
                bookingDetails.view = requestData.saveRoomDetails.viewType
                bookingDetails.seasonType = requestData.saveRoomDetails.seasonType
                bookingDetails.bookingDays = requestData.saveRoomDetails.bookingDay
                bookingDetails.costPrice = requestData.saveRoomDetails.costPrice.toDouble()
                bookingDetails.weekendCostPrice = requestData.saveRoomDetails.weekendCostPrice.toDouble()
                bookingDetails.save()
                for(int i=0; i<=diffInDays; i++) {
                    currentDate = startCalendar.getTime();
                    int day = startCalendar.get(Calendar.DAY_OF_WEEK)
                    if(selectedDays.contains(day.toString())) {
                        def weekendDays = new WeekendDays()
                        weekendDays.bookingDetailsId = bookingDetails.id
                        weekendDays.weekendDays = currentDate
                        weekendDays.save()
                    } else {
                        def workingDays = new WorkingDays()
                        workingDays.bookingDetailsId = bookingDetails.id
                        workingDays.workingDays = currentDate
                        workingDays.save()
                    } 
                    startCalendar.add(Calendar.DATE, 1);
                    currentDate = startCal.getTime();
                }
                render 'Success'
            }
        }
    }
}
    