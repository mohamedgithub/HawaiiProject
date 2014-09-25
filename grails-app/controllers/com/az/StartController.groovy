package com.az
import grails.plugin.springsecurity.annotation.Secured

class StartController {
    
    @Secured(['ROLE_ADMIN'])
    def index() {
        render(view:'home')
    }
    
    @Secured(['ROLE_ADMIN'])
    def house() {
        render(view:'house')
    }
}
