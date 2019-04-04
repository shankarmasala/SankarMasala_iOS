import Foundation
import FastEasyMapping
import MagicalRecord
@objc(CountryDelivery)
open class CountryDelivery: _CountryDelivery {
	// Custom logic goes here.
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: CountryDelivery.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: CountryDelivery.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [CountryDelivery]? {
        return CountryDelivery.mr_findAll() as? [CountryDelivery]
    }
    
    class func newEntity() -> CountryDelivery? {
        let new = CountryDelivery.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
