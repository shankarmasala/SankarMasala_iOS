import Foundation
import FastEasyMapping
import MagicalRecord
@objc(State)
open class State: _State {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: State.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: State.self) as! [String : String]
        mapping.addAttributes(from: dict)
        return mapping
    }
    
    class func getAll() -> [State]? {
        return State.mr_findAll() as? [State]
    }
    
    
    class func getById(stateid : String) -> State? {
        return State.mr_findFirst(with: NSPredicate(format: "self.state_id == %@",stateid))
    }
    
    class func newEntity() -> State? {
        let new = State.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
