import Foundation
import FastEasyMapping
import MagicalRecord
@objc(ProductAttribute)
open class ProductAttribute: _ProductAttribute {
	// Custom logic goes here.
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: ProductAttribute.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: ProductAttribute.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [ProductAttribute]? {
        return ProductAttribute.mr_findAllSorted(by: "entityid", ascending: true) as? [ProductAttribute]
    }
    
    class func newEntity() -> ProductAttribute? {
        let new = ProductAttribute.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
