
import UIKit
import Foundation

typealias ItemLoadedBlock = (_ result: Any, _ error : String) -> (Void)
typealias ItemSavedBlock = (_ result: Any,  _ error : String,  _ message : String) -> (Void)
typealias CellActionBlock = (_ anyObject: Any) -> (Void)
typealias CallBackCompletion = (_ object: Any) -> (Void)

@available(iOS 10.0, *)
let loaderSize = CGSize(width: 30, height: 30)
let appDelegateShared = UIApplication.shared.delegate as? AppDelegate

let kLoginAutheticationHeader                 = "LoginAutheticationHeader"
let googleClientID                            = "1072730711827-8trjd9874k5pphr644p8dp0ndb9krq7l.apps.googleusercontent.com"

//AIzaSyBgJJJoI9JHw-d7i4x71SuW2zcWprJum-Y
let GoogleMapsAPIServerKey                    = "AIzaSyDm661ykrQCv2M2DJ16MxAbgSH9LF-18_g"


