package com.az

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class StartController {
    
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        render(view:'home')
    }
    
    def test() {
        render(view:'test')
    }
 
}
