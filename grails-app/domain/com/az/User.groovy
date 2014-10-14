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
        
        static transients = ['springSecurityService']

	static constraints = {
		username blank: false
		email blank: false, unique: true
		location blank: false
		phonenumber blank: false
		password blank: false
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
