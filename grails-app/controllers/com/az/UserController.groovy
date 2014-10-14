package com.az

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import hawaii.Form

@Secured(['ROLE_ADMIN'])
class UserController {
    
    SpringSecurityService springSecurityService
    def passwordEncoder
    
      static allowedMethods = [saveItem:'POST', createAccount:'POST', deleteItem:'POST', editProfile:'POST', deleteUser:'POST', getCurrentUserName:'GET']
    
    def editProfile() {
        def requestData = request.JSON
        def user = springSecurityService.currentUser
        def searchName = User.findByUsername(requestData.userDetails.userName)
        def searchEmail = User.findByEmail(requestData.userDetails.email)
        if(requestData.userDetails.email == user.email) {
            user.username = requestData.userDetails.userName
            user.email = requestData.userDetails.email
            user.location = requestData.userDetails.location
            user.phonenumber = requestData.userDetails.phoneNumber
            user.save(flush:true)
            render user as JSON 
        } else if(searchEmail) {
            render "Email not Valid"
        } else {
            user.username = requestData.userDetails.userName
            user.email = requestData.userDetails.email
            user.location = requestData.userDetails.location
            user.phonenumber = requestData.userDetails.phoneNumber
            user.save(flush:true) 
            render user as JSON  
        }
    }
    
    def getCurrentUserName() {
            def user = springSecurityService.currentUser
            render user as JSON
        }
    
      def createAccount() {
        def newUserDetails = request.JSON
        def user = new User()
        user.username = newUserDetails.newUser.name
        user.password = newUserDetails.newUser.password
        user.save()
        def addRole = new UserRole()
        addRole.role = Role.findByAuthority("ROLE_USER");
        addRole.user = user;
        addRole.save(flush: true)
        def userDetails = User.findAll()
        render userDetails as JSON
    }
    
    def showUserList() {
        def userDetails = User.findAll()
        def role = Role.findByAuthority("ROLE_USER")
        def users = UserRole.findAllByRole(role)?.user
        render users as JSON
    }
    
    def deleteUser() {
        def requestData = request.JSON
        def user = User.findById(requestData.userId)
        if(user) {
            def roleId = UserRole.findByUser(user)
            roleId.delete(flush: true)
        }
        
        user.delete(flush: true)
        render "User Deleted"
    }
    
    def deleteItem() {
        def deleteItem = request.JSON
        def searchName = Form.findById(deleteItem.deleteInfo.id)
        if(!searchName) {
            render "NO Item found"
        }
        searchName.delete(flush:true)
        render "OK"
    }
    
    def saveItem() {
        def object = request.JSON
        def form = new Form()
        for(def exp: object.info) {
            form.name = object.info.name
            form.email = object.info.email
        }
        form.save(flush:true)
        redirect(action:'show')
    }
    
    def show() {
         def obj = Form.findAll()
         render obj as JSON 
    }
}
