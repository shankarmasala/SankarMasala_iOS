import Foundation
import FastEasyMapping
import MagicalRecord
@objc(Country)
open class CountryObject: _CountryObject {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: CountryObject.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: CountryObject.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.addToManyRelationshipMapping(State.defaultMapping(), forProperty: "states", keyPath: "states")
        return mapping
    }
    
    class func getAll() -> [CountryObject]? {
        return CountryObject.mr_findAll() as? [CountryObject]
    }
    
    class func newEntity() -> CountryObject? {
        let new = CountryObject.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
