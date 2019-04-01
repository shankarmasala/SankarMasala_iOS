
import UIKit

typealias AccountBlock = (_ success : Bool, _ request: Account, _ errorMessage: String) -> (Void)
class Account: NSObject ,NSCoding {
    var accountBlock: AccountBlock  = {_,_,_ in }
    
    var mobile_number : String = ""
    var verification_key : String = ""
    var country_code : String = ""
    var access_token : String = ""
    var expires_in : String = ""
    var token_type : String = ""
    var refresh_token : String = ""
//    var isVerified : String = "false" // false
    var entity_id : String = ""
    var username : String = ""
    var roleId : String = ""
    var latlong : String = ""
    var status : String = ""
    var first_name : String = ""
    var last_name : String = ""
    var email : String = ""
    var address : String = ""

    
    
    
    let ENCODING_VERSION:Int = 1
    
    override init() {}
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(ENCODING_VERSION, forKey: "version")
        aCoder.encode(mobile_number, forKey: "mobile_number")
        aCoder.encode(verification_key, forKey: "verification_key")
        aCoder.encode(country_code, forKey: "country_code")
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(token_type, forKey: "token_type")
        aCoder.encode(refresh_token, forKey: "refresh_token")
        aCoder.encode(entity_id, forKey: "entity_id")
        aCoder.encode(username, forKey: "username")
        aCoder.encode(roleId, forKey: "roleId")
        aCoder.encode(latlong, forKey: "latlong")
        aCoder.encode(status, forKey: "status")
        aCoder.encode(first_name, forKey: "first_name")
        aCoder.encode(last_name, forKey: "last_name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(address, forKey: "address")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        if(aDecoder.decodeInteger(forKey: "version") == ENCODING_VERSION) {
            mobile_number = aDecoder.decodeObject(forKey: "mobile_number") as! String
            verification_key = aDecoder.decodeObject(forKey: "verification_key") as! String
            country_code = aDecoder.decodeObject(forKey: "country_code") as! String
            access_token = aDecoder.decodeObject(forKey: "access_token") as! String
            expires_in = aDecoder.decodeObject(forKey: "expires_in") as! String
            token_type = aDecoder.decodeObject(forKey: "token_type") as! String
            refresh_token = aDecoder.decodeObject(forKey: "refresh_token") as! String
            entity_id = aDecoder.decodeObject(forKey: "entity_id") as! String
            username = aDecoder.decodeObject(forKey: "username") as! String
            roleId = aDecoder.decodeObject(forKey: "roleId") as! String
            latlong = aDecoder.decodeObject(forKey: "latlong") as! String
            status = aDecoder.decodeObject(forKey: "status") as! String
            first_name = aDecoder.decodeObject(forKey: "first_name") as! String
            last_name = aDecoder.decodeObject(forKey: "last_name") as! String
            email = aDecoder.decodeObject(forKey: "email") as! String
            address = aDecoder.decodeObject(forKey: "address") as! String
        }
    }
    
    func parseAuth_data(dataDict:NSDictionary) {
        if let str = dataDict.value(forKey: "access_token") as? String{
            self.access_token = str
        }
        if let str = dataDict.value(forKey: "expires_in") as? String{
            self.expires_in = str
        }
        if let str = dataDict.value(forKey: "token_type") as? String{
            self.token_type = str
        }
        if let str = dataDict.value(forKey: "refresh_token") as? String{
            self.refresh_token = str
        }
    }
    
    func parseUserDict(dataDict:NSDictionary) {
        if let str = dataDict.value(forKey: "id") as? String{
            self.entity_id = str
        }
        if let str = dataDict.value(forKey: "username") as? String{
            self.username = str
        }
        if let str = dataDict.value(forKey: "roleId") as? String{
            self.roleId = str
        }
        if let str = dataDict.value(forKey: "first_name") as? String{
            self.first_name = str
        }
        if let str = dataDict.value(forKey: "last_name") as? String{
            self.last_name = str
        }
        if let str = dataDict.value(forKey: "email") as? String{
            self.email = str
        }
        if let str = dataDict.value(forKey: "address") as? String{
            self.address = str
        }
    }
    
    func login( block: @escaping AccountBlock)  {
        accountBlock = block
        let request = Request.init(url: "\(kBaseUrl)\(kLogin)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if(request.isSuccess){
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        self.accountBlock(false,self,dict["login_error_message"] as! String)
                        return
                    }
                    
                    if let auth_data = dict["auth_data"] as? [String : Any]{
                        if let access_token = auth_data["access_token"] as? String{
                            self.access_token = access_token
                            Utils.setStringForKey(access_token, key: "token")
                        }
                        if let expires_in = auth_data["expires_in"] as? Int{
                            self.expires_in =  String(expires_in)
                        }
                        if let token_type = auth_data["token_type"] as? String{
                            self.token_type = token_type
                        }
                        if let refresh_token = auth_data["refresh_token"] as? String{
                            self.refresh_token = refresh_token
                        }
                    }
                    let arr = dict["data"] as! [[String : Any]]
                    for dict in arr{
                        if let entityid = dict["id"] as? Int{
                            self.entity_id = String(entityid)
                        }
                        if let username = dict["username"] as? String{
                            self.username = username
                        }
                        if let roleId = dict["roleId"] as? Int{
                            self.roleId = String(roleId)
                        }
                        if let first_name = dict["first_name"] as? String{
                            self.first_name = first_name
                        }
                        if let last_name = dict["last_name"] as? String{
                            self.last_name = last_name
                        }
                        if let email = dict["email"] as? String{
                            self.email = email
                        }
                        if let address = dict["address"] as? String{
                            self.address = address
                        }
                        
                    }
                }
                
                self.accountBlock(true,self,"")
                
            }else{
                self.accountBlock(false,self,message as String)
            }
            
            
        }
        request.setParameter(self.mobile_number, forKey: "password")
        request.setParameter("password", forKey: "grant_type")
        request.setParameter("testpass", forKey: "client_secret")
        request.setParameter("testclient", forKey: "client_id")
        request.setParameter(self.verification_key, forKey: "verification_key")
        request.setParameter(self.mobile_number, forKey: "username")
        request.setParameter(self.country_code, forKey: "country_code")
        request.startRequest()
    }
    func register( block: @escaping AccountBlock)  {
        accountBlock = block
        let request = Request.init(url: "\(kBaseUrl)\(kRegister)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if(request.isSuccess){
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        self.accountBlock(false,self,dict["error_message"] as! String)
                        return
                    }
                    
                    let data_dict = dict["data"] as! [String : Any]
                    if let username = data_dict["username"] as? String{
                        self.username = username
                    }
                    if let latlong = data_dict["latlong"] as? String{
                        self.latlong = latlong
                    }
                    if let status = data_dict["status"] as? String{
                        self.status = status
                    }
                    if let role_id = data_dict["role_id"] as? String{
                        self.roleId = role_id
                    }
                
                }
                
                self.accountBlock(true,self,"")
                
            }else{
                self.accountBlock(false,self,message as String)
            }
            
            
        }
        request.setParameter(self.mobile_number, forKey: "username")
        request.setParameter(self.mobile_number, forKey: "password")
        request.setParameter("password", forKey: "grant_type")
        request.setParameter("tiacreation", forKey: "client_secret")
        request.setParameter("tiacreation", forKey: "client_id")
        request.setParameter("5666", forKey: "latlong")
        request.setParameter("1", forKey: "status")
        request.setParameter("1", forKey: "role_id")
        request.startRequest()
    }
    
    func editUser( block: @escaping AccountBlock)  {
        accountBlock = block
        let request = Request.init(url: "\(kBaseUrl)\(kEditUser)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if(request.isSuccess){
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        self.accountBlock(false,self,dict["login_error_message"] as! String)
                        return
                    }
                    
                    let arr = dict["data"] as! [[String : Any]]
                    for dict in arr{
                        if let entityid = dict["id"] as? Int{
                            self.entity_id = String(entityid)
                        }
                        if let username = dict["username"] as? String{
                            self.username = username
                        }
                        if let roleId = dict["roleId"] as? Int{
                            self.roleId = String(roleId)
                        }
                        if let first_name = dict["first_name"] as? String{
                            self.first_name = first_name
                        }
                        if let last_name = dict["last_name"] as? String{
                            self.last_name = last_name
                        }
                        if let email = dict["email"] as? String{
                            self.email = email
                        }
                        if let address = dict["address"] as? String{
                            self.address = address
                        }
                        if let latlong = dict["latlong"] as? String{
                            self.latlong = latlong
                        }
                        
                        if let status = dict["status"] as? String{
                            self.status = status
                        }
                    }
                }
                
                self.accountBlock(true,self,"")
                
            }else{
                self.accountBlock(false,self,message as String)
            }
            
            
        }
        
        request.setParameter(self.mobile_number, forKey: "username")
        request.setParameter(self.email, forKey: "email")
        request.setParameter(self.first_name, forKey: "first_name")
        request.setParameter(self.last_name, forKey: "last_name")
        request.setParameter(self.address, forKey: "address")
        request.setParameter("password", forKey: "grant_type")
        request.setParameter("testpass", forKey: "client_secret")
        request.setParameter("testclient", forKey: "client_id")
        request.setParameter(self.entity_id, forKey: "id")
        request.setParameter("1", forKey: "status")
        request.setParameter("1", forKey: "role_id")
        request.startRequest()
    }
    
    
//    func register(block: @escaping AccountBlock){
//        accountBlock = block
//        let request = Request.init(url: "\(kBaseUrl)\(kRegister)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                let serverDict = request.serverData as NSDictionary
//                if (serverDict.value(forKey: "data") != nil) {
//                    let dataDict = serverDict.value(forKey: "data") as! NSDictionary
//                    if (dataDict.value(forKey: "user") != nil) {
//                        self.parseUserDict(dataDict: dataDict)
//                    }
//                    Utils.setStringForKey(self.token, key: "token")
//                }
//                self.accountBlock(true,self,"")
//            }else{
//                self.accountBlock(false,self,message as String)
//            }
//        }
//
//        request.setParameter(name, forKey: "name")
//        request.setParameter(email, forKey: "email")
//        request.setParameter(password, forKey: "password")
//        request.startRequest()
//    }
//
//    func forgotPassword(block: @escaping AccountBlock){
//        accountBlock = block
//        let request = Request.init(url: "\(kBaseUrl)\(kForgotPassword)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                let serverDict = request.serverData as NSDictionary
//                if (serverDict.value(forKey: "data") != nil) {
//                    _ = serverDict.value(forKey: "data") as! NSDictionary
//                }
//                self.accountBlock(true,self,message as String)
//            }else{
//                self.accountBlock(false,self,message as String)
//            }
//        }
//        request.setParameter(email, forKey: "email")
//        request.startRequest()
//    }
//
//    func EditProfile(block: @escaping AccountBlock){
//        accountBlock = block
//        let url = "\(kEditProfile)\(AccountManager.instance().activeAccount!.user_id)"
//        let request = Request.init(url: "\(kBaseUrl)\(url)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                let serverDict = request.serverData as NSDictionary
//                if (serverDict.value(forKey: "data") != nil) {
//                    if let dataDict = serverDict.value(forKey: "data") as? NSDictionary {
//                        self.parseUserDict(dataDict: dataDict)
//                    }
//                 //   Utils.setStringForKey(self.token, key: "token")
//                }
//                self.accountBlock(true,self,"")
//            }else{
//                self.accountBlock(false,self,message as String)
//            }
//        }
//        request.setParameter(name, forKey: "name")
//        request.setParameter(email, forKey: "email")
//        request.startRequest()
//    }
//
//    func uploadImage(img: UIImage, block : @escaping AccountBlock)  {
//        accountBlock = block
//        let url = "\(kUploadImage)\(AccountManager.instance().activeAccount!.user_id)"
//        let request = Request.init(url: "\(kBaseUrl)\(url)", method: RequestMethod(rawValue: "MULTI_PART_FORM")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                print(request.serverData)
//                var dict = [String : Any]()
//                if let dict = request.serverData["data"] as? NSDictionary {
//                    self.parseUserDict(dataDict: dict)
//                }
//                self.accountBlock(true,self,"")
//            } else {
//                self.accountBlock(false,self,message as String)
//            }
//        }
//
//        request.setParameter(img.jpeg(.lowest)!, forKey: "file")
//      //  request.setParameter("avatar", forKey: "Field")
//        request.setParameter("avatar", forKey: "field")
//        request.startRequest()
//    }
//
//    func facebookLogin(block: @escaping AccountBlock) {
//        let request = Request.init(url: "\(kBaseUrl)\(kFacebook_login)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                let serverDict = request.serverData as NSDictionary
//                if (serverDict.value(forKey: "data") != nil) {
//                    let dataDict = serverDict.value(forKey: "data") as! NSDictionary
//                    if (dataDict.value(forKey: "user") != nil) {
//                        self.parseUserDict(dataDict: dataDict)
//                    }
//                    Utils.setStringForKey(self.token, key: "token")
//                }
//                block(true,self,"")
//            }else{
//                block(false,self,message as String)
//            }
//        }
//        request.setParameter(fb_accessToken, forKey: "access_token")
//        request.startRequest()
//    }
//
//    func googleLogin(block: @escaping AccountBlock) {
//        let partRequest = kGoogle_login
//        let request = Request.init(url: "\(kBaseUrl)\(partRequest)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
//            if(request.isSuccess){
//                let serverDict = request.serverData as NSDictionary
//                if (serverDict.value(forKey: "data") != nil) {
//                    let dataDict = serverDict.value(forKey: "data") as! NSDictionary
//                    if (dataDict.value(forKey: "user") != nil) {
//                        self.parseUserDict(dataDict: dataDict)
//                    }
//                    Utils.setStringForKey(self.token, key: "token")
//                }
//                block(true,self,"")
//            }else{
//                block(false,self,message as String)
//            }
//        }
//        request.setParameter(name, forKey: "name")
//        request.setParameter(avatar, forKey: "avatar")
//        request.setParameter(google, forKey: "google")
//        request.setParameter(provider, forKey: "provider")
//        request.setParameter(is_deleted, forKey: "is_deleted")
//        request.setParameter(email, forKey: "email")
//        request.startRequest()
//    }
}
