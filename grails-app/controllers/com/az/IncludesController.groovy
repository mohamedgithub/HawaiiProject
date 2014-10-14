package com.az

import grails.converters.JSON
import com.az.*;
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import hawaii.Form

@Secured(['ROLE_ADMIN'])
class IncludesController {
    
    static allowedMethods = [saveItem:"POST", deleteItem:"POST"]
    def springSecurityService
    def passwordEncoder
    
    def head() {
        render(view:'head')
    }
    def nav() {
        render(view:'nav')
    }
    
    def dashboard() {
        render(view:'dashboard')
    }
    
    def config() {
        render(view:'config')
    }
    
    def showProfile() {
        render(view:'profile')
    }
    
    def account() {
        render(view:'createAccount')
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
    
    def deleteItem() {
        def deleteItem = request.JSON
        def searchName = Form.findById(deleteItem.deleteInfo.id)
        if(!searchName) {
            render "NO Item found"
        }
        searchName.delete(flush:true)
        render "OK"
    }
}

