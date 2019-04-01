import UIKit
import MagicalRecord
import FastEasyMapping

class Manager: NSObject {

}
//MARK: - Shipping City
extension Manager{
    class func loadCountryStates(block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kShiipingMethodList)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
//                            CountryObject.mr_truncateAll(in: localContext)
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: CountryObject.defaultMapping(), context: localContext)
                            DispatchQueue.main.async {
                                block(arr,"")
                            }
                        })
                    }else{
                         block("",message as String)
                    }
                }
            }
        }
        request.startRequest()
    }
    
    class func loadCitiesByCountryId(countryid : String ,block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kShiipingMethodList)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataDict = dict["data"] as? [String : Any] {
                        if let dataArray = dataDict["shipping_methods"] as? [[String : Any]] {
                            MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
//                                ShippingMethods.mr_truncateAll(in: localContext)
                                let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: ShippingMethods.defaultMapping(), context: localContext)
                                DispatchQueue.main.async {
                                    block(arr,"")
                                }
                            })
                        }
                    }else {
                        block("",message as String)
                    }
                }
            }
        }
        request.setParameter(countryid, forKey: "state_id")
        
        request.startRequest()
    }
    
}

//MARK:- Category
extension Manager {
    
   class func loadAllCategory(block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kAllCategory)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
//                            Categori.mr_truncateAll(in: localContext)
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: Categori.defaultMapping(), context: localContext)
                            DispatchQueue.main.async {
                                block(arr,"")
                            }
                        })
                    } else {
                        block("",message as String)
                    }
                }
            }
        }
        request.startRequest()
    }
    
    class func loadAllProductByCategory(cat : Categori , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kAllProduct)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
//                            Product.mr_truncateAll(in: localContext)
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: Product.defaultMapping(), context: localContext)
                            DispatchQueue.main.async {
                                block(arr,"")
                            }
                        })
                    } else {
                        block("",message as String)
                    }
                }
            }
        }
        let categoryid = "\(String(describing: cat.entityid!))"
        request.setParameter(categoryid, forKey: "categoryId")
       // request.setParameter("", forKey: "isOffer")
        //request.setParameter("", forKey: "isNew")
        request.startRequest()
    }
    class func loadProductByProductName(productname : String , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kSearchProduct)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
//                            Product.mr_truncateAll(in: localContext)
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: Product.defaultMapping(), context: localContext)
                            DispatchQueue.main.async {
                                block(arr,"")
                            }
                        })
                    } else {
                        block("",message as String)
                    }
                }
            }
        }
        request.setParameter(productname, forKey: "productName")
        request.startRequest()
    }
}
            

