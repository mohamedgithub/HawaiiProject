
import com.az.Role
import com.az.User
import com.az.UserRole

class BootStrap {

    def init = { servletContext ->
        
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        
        def testUser = new User(username: 'admin', enabled: true, password: 'admin',email: 'admin@assistanz.com', location:'coimbatore', phonenumber:'8807282182', language:null)
        testUser.save(flush: true)
        
        def testUsers = new User(username: 'user', enabled: true, password: 'letmein',email: 'user@assistanz.com', location:'coimbatore', phonenumber:'8807419885',language:null)
        testUsers.save(flush: true)
        
        def addRole = new UserRole()
        addRole.role = adminRole;
        addRole.user = testUser;
        addRole.save(flush: true)
        
        def addRoles = new UserRole()
        addRoles.role = userRole;
        addRoles.user = testUsers;
        addRoles.save(flush:true)
    }
    def destroy = {
    }
}
