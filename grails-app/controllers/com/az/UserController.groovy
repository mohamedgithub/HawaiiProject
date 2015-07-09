package com.az

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import hawaii.Form

@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserController {
    
    SpringSecurityService springSecurityService
    def passwordEncoder
    
      static allowedMethods = [saveItem:'POST',createUser:'POST', createAccount:'POST', deleteItem:'POST', editProfile:'POST', deleteUser:'POST', getCurrentUserName:'GET', getDefaultLanguage:'GET']
    
    def editProfile() {
        def requestData = request.JSON
        def user = springSecurityService.currentUser
        def searchName = User.findByUsername(requestData.userDetails.userName)
        def searchEmail = User.findByEmail(requestData.userDetails.email)
        if(requestData.userDetails.userName == user.username) {
            if(requestData.userDetails.email == user.email) {
                user.username = requestData.userDetails.userName
                user.email = requestData.userDetails.email
                user.location = requestData.userDetails.location
                user.phonenumber = requestData.userDetails.phoneNumber
                user.language = requestData.userDetails.myLanguage.value
                user.save(flush:true)
                render user as JSON 
            } else if(searchEmail) {
                render "Email not valid"
            } else {
                user.username = requestData.userDetails.userName
                user.email = requestData.userDetails.email
                user.location = requestData.userDetails.location
                user.phonenumber = requestData.userDetails.phoneNumber
                user.language = requestData.userDetails.myLanguage.value
                user.save(flush:true)
                render user as JSON 
            } 
        } else if(searchName) {
            render "Name not valid"
        } else {
            user.username = requestData.userDetails.userName
            user.email = requestData.userDetails.email
            user.location = requestData.userDetails.location
            user.phonenumber = requestData.userDetails.phoneNumber
            user.language = requestData.userDetails.myLanguage.value
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

    def getDefaultLanguage() {
        def userdefaultLanuage = springSecurityService.currentUser?.language
        if(userdefaultLanuage == null) {
            render 'EN-US'
        } else {
            render userdefaultLanuage
        }
    }

    def getLanguage() {
        def userLanuage = springSecurityService.currentUser?.language
        if(userLanuage == 'EN-US') {
            render 'English'
        } else if(userLanuage == 'AR-AE') {
            render 'Arabic'
        } else if(userLanuage == 'ES-ES') {
            render 'Spanish'
        } else {
            render 'English'
        }
    }

    def createUser() {
        def requestData = request.JSON
        Console.print(requestData.userDetails)
    }
    
      def getImage() {
        def file = request.getFile("myFile")
        def user = springSecurityService.currentUser
        user.filename = file.originalFilename
        user.fullPath = grailsApplication.config.uploadFolder + user.filename
        file.transferTo(new File(user.fullPath))
        user.file = file
        user.save(flush:true)
        redirect(url: "http://localhost:8080/Hawaii/#/user/profile")  
    }
    
    
    def getProfileImage() {
        def user = springSecurityService.currentUser
        render user as JSON
    }
    def checkPassword() {
        
        
        HashMap fieldErrors = new HashMap()
        HashMap item = new HashMap()
        HashMap passwordError = new HashMap()
        HashMap passwordErrors = new HashMap()
        
        def password = request.JSON
        PasswordValidationCommand passwordObject = new PasswordValidationCommand()
        passwordObject.newPassword = password.change.newPassword
        passwordObject.confirmPassword = password.change.confirmPassword
        passwordError.clear();
        if(!passwordObject.validate()) {
            passwordObject.errors.allErrors.each {
                if (passwordObject.errors.hasFieldErrors("newPassword")) {
                    item.put("newPassword", "empty_field") 
                }
                if (passwordObject.errors.hasFieldErrors("confirmPassword")) {
                    item.put("confirmPassword", "empty_field")
                }
                passwordError.put("error", item)
                render passwordError as JSON
            }
        } else { 
            if(passwordObject.newPassword.equals(passwordObject.confirmPassword)) {
                def user = springSecurityService.currentUser
                if(passwordEncoder.isPasswordValid(user.password, password.change.newPassword, null)) {
                    fieldErrors.put("equalPassword","equal_password")   
                } else if(!passwordEncoder.isPasswordValid(user.password, password.change.oldPassword, null)) {
                    fieldErrors.put("oldPasswordIncorrect","old_password_incorrect") 
                } else {
                    user.password = password.change.newPassword
                    user.save(flush:true);
                    fieldErrors.put("success","success") 
                }
            } else { 
                fieldErrors.put("mismatch","mismatch")
            }
            passwordErrors.put("fieldErrors", fieldErrors)
        }
        render passwordErrors as JSON
    }
}

@grails.validation.Validateable
class PasswordValidationCommand {
    
    String newPassword;
    String confirmPassword;
    
    static constraints = { 
        newPassword blank: false, nullable: false 
        confirmPassword blank: false, nullable: false 
    } 
}

