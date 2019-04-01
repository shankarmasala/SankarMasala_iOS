

import UIKit
import FBSDKLoginKit

typealias SocialBlock = (_ result : Any, _ error: NSString) -> (Void)


class FBHelper: NSObject {
    var socialBlock: SocialBlock  = {_,_ in }
    
    class func instance() -> FBHelper {
        var singleton: FBHelper? = nil
        if singleton == nil {
            singleton = FBHelper()
        }
        return singleton!
    }

    
    func authenticateWithBlock(block: @escaping SocialBlock){
        socialBlock = block
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email","user_birthday", "user_friends"], from: nil) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")){
                        self.socialBlock(fbloginresult,"")
//                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }

}
