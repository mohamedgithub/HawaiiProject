package com.az

import java.security.MessageDigest
import java.security.Timestamp
import java.sql.Timestamp

class TestController {
    def mailService
    static allowedMethods = [createUser:'POST']
    

    def index() {
       
    }
    def forgotPassword() {
        render(view:'test')
    }
    
    def checkName() {
        def user = User.findByEmail(params.email)
        if(user) {
            Date date = new Date();
            def time = new Timestamp(date.getTime())
            def token = params.email + date.toString()
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(token.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            user.token = hashtext.toString();
            user.save(flush:true);
            def verifyLink = "http://localhost:8080/Hawaii/test/resetPassword/" + hashtext.toString()
            mailService.sendMail {
                to params.email
                subject "Reset your Password "
                body "Click link to reset your account password " + verifyLink  + " Your Token ID : " + hashtext.toString()
            }
                render(view:'checkMail')
        } else {
            render(view:'emailFailure')
        }
    }
    
    def resetPassword() {
        render(view:'resetPassword')
    }
    
    def savePassword() {
        def findToken = User.findByToken(params.token)
        if(findToken) {
            if(params.confirmPassword == params.newPassword) {
                findToken.password = params.newPassword
                findToken.save(flush:true)
                findToken.token = null;
                render(view:'resetPasswordSuccess')
            } else {
                render(view:'resetPasswordFailure')
            }
        } else {
             render(view:'resetPasswordFailure')
        } 
    }
    
    def signUpUser() {
        render(view:'signup')
    }
    
    def createUser() {
        def requestData = request.JSON
        def user = new User()
        def searchUser =  User.findByUsername(requestData.userDetails.name)
        def searchMail = User.findByEmail(requestData.userDetails.email)
        if(searchUser) {
            render "failed"
        } else if(searchMail) {
            render "failure" 
        } else {
            user.username = requestData.userDetails.name
            user.password = requestData.userDetails.password
            user.email = requestData.userDetails.email
            user.location = requestData.userDetails.location
            user.phonenumber = requestData.userDetails.phoneNumber
            user.save(flush:true)
            def addRole = new UserRole()
            addRole.role = Role.findByAuthority("ROLE_USER");
            addRole.user = user;
            addRole.save(flush: true)
            render "success"
        }
    }
    
  
}
