package com.az
import grails.plugin.springsecurity.annotation.Secured

class StartController {
    
    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
        render(view:'home')
    }
}
