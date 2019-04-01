import Foundation
import FastEasyMapping
import MagicalRecord

@objc(Categori)
open class Categori: _Categori {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: Categori.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: Categori.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [Categori]? {
        return Categori.mr_findAllSorted(by: "display_order", ascending: true) as? [Categori]
    }
    
    class func newEntity() -> Categori? {
        let new = Categori.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
