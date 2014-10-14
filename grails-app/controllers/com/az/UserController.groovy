package com.az

import grails.converters.JSON
import com.az.*;
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import hawaii.Form

@Secured(['ROLE_ADMIN'])
class UserController {

    def springSecurityService
    def passwordEncoder
    
    def changePassword() {
        render(view:"changePassword")
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
