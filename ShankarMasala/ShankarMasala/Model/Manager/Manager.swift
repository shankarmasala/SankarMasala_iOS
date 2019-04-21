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
                            Categori.mr_truncateAll(in: localContext)
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
    
    class func loadCategoryById(cate : Categori , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kGetCategoryById)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
                           // Categori.mr_truncateAll(in: localContext)
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
        let entityid = "\(String(describing: cate.entityid!))"
        
        request.setParameter(entityid, forKey: "id")
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
    
    
    class func loadAllStore(block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kStores)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: Store.defaultMapping(), context: localContext)
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
    
    class func loadAllCountryDelivery(block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kfetchAllCountry)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: CountryDelivery.defaultMapping(), context: localContext)
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
    
    class func loadAllStateDeliveryBy(countryid : String , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kfetchAllState)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: StateDelivery.defaultMapping(), context: localContext)
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
        request.setParameter(countryid, forKey: "countryId")
        request.startRequest()
    }
    
    class func loadAllCityDeliveryBy(stateid : String , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kfetchCity)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
                            let arr = FEMDeserializer.collection(fromRepresentation: dataArray, mapping: CityDelivery.defaultMapping(), context: localContext)
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
        request.setParameter(stateid, forKey: "stateId")
        request.startRequest()
    }
    
    class func loadAllOrders(block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kAllOrders)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataArray = dict["data"] as? [[String : Any]] {
                        block(dataArray,"")
                    } else {
                        
                    }
                }
            }
        }
//        request.setParameter(stateid, forKey: "userId")
        request.startRequest()
    }
    
    class func loadOrderByInvoiceId(invoceid : String , block : @escaping ItemLoadedBlock) {
        let request = Request.init(url: "\(kBaseUrl)\(kFetchOrder)", method: RequestMethod(rawValue: "POST")!) { (success:Bool, request:Request, message:NSString) -> (Void) in
            if request.isSuccess {
                let arr = request.serverData["data"] as! [[String : Any]]
                for dict in arr{
                    if dict["status"] as! String == "False"{
                        block("",dict["message"] as! String)
                        return
                    }
                    
                    if let dataObject = dict["data"] as? [String : Any] {
                       block(dataObject,"")
                    } else {
                        block("",message as String)
                    }
                }
            }
        }
        request.setParameter(invoceid, forKey: "invoiceId")
        request.startRequest()
    }
    
}
            

