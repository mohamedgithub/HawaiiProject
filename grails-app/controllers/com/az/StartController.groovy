package com.az

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class StartController {
    
    @Secured(['ROLE_ADMIN'])
    def index() {
        render(view:'home')
    }
 
}
