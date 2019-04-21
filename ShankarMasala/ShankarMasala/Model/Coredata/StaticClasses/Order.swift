import Foundation
import FastEasyMapping
import MagicalRecord
@objc(Order)
open class Order: _Order {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: Order.entityName())
        var dict: [String: String] = CDHelper.mapping(cls: Order.self) as! [String : String]
        dict.removeValue(forKey: "createdDate");
        dict.removeValue(forKey: "updatedDate");
        mapping.addAttribute(Order.dateTimeAttribute(for: "createdDate", andKeyPath: "createdDate"))
        mapping.addAttribute(Order.dateTimeAttribute(for: "updatedDate", andKeyPath: "updatedDate"))
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "itemId"
        return mapping
    }
    
    class func getAll() -> [Order]? {
        return Order.mr_findAll() as? [Order]
    }
    
    class func newEntity() -> Order? {
        let new = Order.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
