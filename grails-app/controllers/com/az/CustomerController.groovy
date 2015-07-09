package com.az

import grails.converters.JSON
import java.text.DateFormat

import java.text.ParseException;
import java.text.SimpleDateFormat
import org.springframework.security.access.annotation.Secured
import java.util.Date;
import java.util.Calendar;

@Secured(['ROLE_ADMIN'])
class CustomerController {
    
    def createCustomer() {
        render(view:'createCustomer')
    }   
    
    def saveCustomer() {
        
        def requestData = request.JSON
        def findCustomer = CreateCustomer.findByCustomerPhoneNumber(requestData.customer.customerPhoneNumber)
        if(findCustomer) {
            render "Failed"
        } else {
            def customer = new CreateCustomer()
            customer.customerName = requestData.customer.customerName
            customer.customerPhoneNumber = requestData.customer.customerPhoneNumber
            customer.amount = requestData.customer.customerAmount
            customer.interest = requestData.customer.customerInterestAmount
            customer.customerAddress = requestData.customer.customerAddress
            customer.guarantorName = requestData.customer.guarantorName
            customer.guarantorPhoneNumber = requestData.customer.guarantorPhoneNumber
            customer.guarantorAddress = requestData.customer.guarantorAddress
            customer.save(flush:true)
            render "Success"
        }
    }
    
    def Customerlist() {
        render(view:'listCustomer')
    }
    
    def listCustomer() {
        def customer = CreateCustomer.findAll()
        render customer as JSON
    }
    
    def deleteCustomer() {
        def requestData = request.JSON
        def customer = CreateCustomer.findById(requestData.deleteId.id)
        customer.delete(flush: true)
        render "deleted"
    }
    
    def editCustomer() {
        def requestData = request.JSON
        def customer = CreateCustomer.findById(requestData.editId)
        render customer as JSON
    }
    
    def customerEdit() {
        render(view:'editCustomer')
    }
    
    def updateCustomer() {
        
        def requestData = request.JSON
        def customer = CreateCustomer.findById(requestData.customer.id)
        if(customer.id == requestData.customer.id) {
            def findcustomer = CreateCustomer.findByCustomerPhoneNumber(requestData.customer.customerPhoneNumber)
            if(!findcustomer) {
                customer.customerName = requestData.customer.customerName
                customer.customerPhoneNumber = requestData.customer.customerPhoneNumber
                customer.amount = requestData.customer.customerAmount
                customer.interest = requestData.customer.customerInterestAmount
                customer.customerAddress = requestData.customer.customerAddress
                customer.guarantorName = requestData.customer.guarantorName
                customer.guarantorPhoneNumber = requestData.customer.guarantorPhoneNumber
                customer.guarantorAddress = requestData.customer.guarantorAddress
                customer.save(flush:true)
                render "Success"
            } else if(findcustomer.id == customer.id) {
                customer.customerName = requestData.customer.customerName
                customer.amount = requestData.customer.customerAmount
                customer.interest = requestData.customer.customerInterestAmount
                customer.customerAddress = requestData.customer.customerAddress
                customer.guarantorName = requestData.customer.guarantorName
                customer.guarantorPhoneNumber = requestData.customer.guarantorPhoneNumber
                customer.guarantorAddress = requestData.customer.guarantorAddress
                customer.save(flush:true)
                render "Success"
            } else if(findcustomer.id != customer.id) {
                render "Failed"
            }
        }
    }
    
    def customerShow() {
        render(view:'showCustomer')
    }
    
    def showCustomer() {
        def requestData = request.JSON
        def customerId = CreateCustomer.findById(requestData.showId)
        def customers = Payment.findAllByCreateCustomer(customerId)
//        def LastCustomerId = Payment.last()
//        def Lastcustomer = Payment.findById(LastCustomerId)
//        Console.print("Customer:" +cus)
        
        def paidAmount = 0;
            for(def i=0; i<customers.size(); i++) {
                paidAmount = (paidAmount + customers[i].payingAmount)
            }
            
            def outStandingAmount = 0
            outStandingAmount = (customerId.amount - paidAmount)    
            HashMap customer = new HashMap()
            customer.put("customerName" ,customerId.customerName)
            customer.put("customerPhoneNumber" ,customerId.customerPhoneNumber)
            customer.put("guarantorName" ,customerId.guarantorName)
            customer.put("guarantorPhoneNumber" ,customerId.guarantorPhoneNumber)
            customer.put("amount" ,customerId.amount)
            customer.put("interest" ,customerId.interest)
            customer.put("paidAmount" ,paidAmount)
            customer.put("outStandingAmount" ,outStandingAmount)
            render customer as JSON
    }
    
    def payment() {
        render(view:'Payment')
    }
    
    def getCustomer() {
        def requestData = request.JSON
        def customer = CreateCustomer.findByCustomerPhoneNumber(requestData.phoneNumber)
        render customer as JSON
    }
    
    def savePayment() {
        def requestData = request.JSON
        def customer = CreateCustomer.findById(requestData.customerPayment.id)
        def findCustomer = Payment.findByCreateCustomer(customer)
        if(!findCustomer) {
            def payment = new Payment()
            payment.date = new Date()
            payment.amount = requestData.customerPayment.amount
            payment.interest = requestData.customerPayment.interest
            payment.paid = requestData.customerPayment.payingAmount
            payment.outstanding = (requestData.customerPayment.amount.toInteger()) - (requestData.customerPayment.payingAmount.toInteger())
            payment.payingAmount = requestData.customerPayment.payingAmount
            payment.createCustomer = customer
            payment.save(flush:true)
        } else {
            def paidAmount = 0;
            def customers = Payment.findAllByCreateCustomer(customer)
            for(def i=0; i<customers.size(); i++) {
                paidAmount = (paidAmount + customers[i].payingAmount)
            }
            def payment = new Payment()
            payment.date = new Date()
            payment.amount = requestData.customerPayment.amount
            payment.interest = requestData.customerPayment.interest
            payment.paid = paidAmount+requestData.customerPayment.payingAmount
            payment.outstanding = (requestData.customerPayment.amount.toInteger()) - (paidAmount+requestData.customerPayment.payingAmount)
            payment.payingAmount = requestData.customerPayment.payingAmount
            payment.createCustomer = customer
            payment.save(flush:true)
        }
    }
}
