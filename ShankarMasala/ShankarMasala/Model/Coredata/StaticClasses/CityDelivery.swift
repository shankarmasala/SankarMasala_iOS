import Foundation
import FastEasyMapping
import MagicalRecord
@objc(CityDelivery)
open class CityDelivery: _CityDelivery {
	// Custom logic goes here.
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: CityDelivery.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: CityDelivery.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [CityDelivery]? {
        return CityDelivery.mr_findAll() as? [CityDelivery]
    }
    
    class func newEntity() -> CityDelivery? {
        let new = CityDelivery.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
