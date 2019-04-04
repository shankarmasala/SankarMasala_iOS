import Foundation
import FastEasyMapping
import MagicalRecord
@objc(StateDelivery)
open class StateDelivery: _StateDelivery {
	// Custom logic goes here.
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: StateDelivery.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: StateDelivery.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [StateDelivery]? {
        return StateDelivery.mr_findAll() as? [StateDelivery]
    }
    
    class func newEntity() -> StateDelivery? {
        let new = StateDelivery.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
