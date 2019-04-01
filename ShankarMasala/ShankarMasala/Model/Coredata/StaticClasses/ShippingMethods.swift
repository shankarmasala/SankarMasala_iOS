import Foundation
import FastEasyMapping
import MagicalRecord

@objc(ShippingMethods)
open class ShippingMethods: _ShippingMethods {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: ShippingMethods.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: ShippingMethods.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [ShippingMethods]? {
        return ShippingMethods.mr_findAllSorted(by: "entityid", ascending: true) as? [ShippingMethods]
    }
    
    class func newEntity() -> ShippingMethods? {
        let new = ShippingMethods.mr_createEntity(in: NSManagedObjectContext.mr_default())
        return new
    }
    
    func save(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    func delete(){
        self.mr_deleteEntity()
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
