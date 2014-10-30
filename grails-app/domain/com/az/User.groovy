package com.az

class User {

	transient springSecurityService

	String username
	String password
        String email
        String location
        String phonenumber
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
        String token
        String language
        String filename
        String fullPath
        String file
        
        static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		email blank: false, unique: true
		location blank: false
		phonenumber blank: false
		password blank: false
                token blank:true, nullable:true
                language blank:true, nullable:true
                filename blank:true, nullable:true
                file blank:true, nullable:true
                fullPath blank:true, nullable:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
