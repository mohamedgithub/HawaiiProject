package hawaii

class Form {
    
    String name
    String email
    
    static constraints = {
        name(blank:false,nullable:false)
        email(blank:false,nullable:false)
    }
}
