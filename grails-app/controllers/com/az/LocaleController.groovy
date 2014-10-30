package com.az

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.servlet.support.RequestContextUtils
import grails.converters.*
import org.springframework.context.i18n.LocaleContextHolder as LCH 
 
@Secured(['ROLE_ADMIN','ROLE_USER'])
class LocaleController {

    def index() {
        redirect(action:"resource")
    }
    
    def resource() {
        
        def langSuffix = "_${params.locale}"
        def props = new java.util.Properties()
        props.load( new FileInputStream( "grails-app/i18n/messages${langSuffix}.properties" ))
        render props as JSON
    }
}
