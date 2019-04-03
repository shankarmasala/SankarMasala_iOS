import Foundation
import FastEasyMapping
import MagicalRecord
@objc(Product)
open class Product: _Product {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: Product.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: Product.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.addToManyRelationshipMapping(ProductAttribute.defaultMapping(), forProperty: "product_attribute", keyPath: "product_attribute")
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [Product]? {
        return Product.mr_findAllSorted(by: "entityid", ascending: true) as? [Product]
    }
    
    class func getOfferAll() -> [Product]? {
        let pre = NSPredicate(format: "is_offer == 1")
        return Product.mr_findAllSorted(by: "entityid", ascending: true, with: pre) as? [Product]
    }
    
    class func getAllByCategory(cat : Categori) -> [Product]? {
        let pre = NSPredicate(format: "category_id == %@",cat.entityid!)
        return Product.mr_findAllSorted(by: "entityid", ascending: true, with: pre) as? [Product]
    }
    
    class func newEntity() -> Product? {
        let new = Product.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
