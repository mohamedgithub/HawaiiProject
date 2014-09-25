package com.az

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class IncludesController {
    
    def head() {
        render(view:'head')
    }
    def nav() {
        render(view:'nav')
    }
}
