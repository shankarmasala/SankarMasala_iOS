import Foundation
import FastEasyMapping
import MagicalRecord
@objc(Store)
open class Store: _Store {
    class func defaultMapping () -> FEMMapping {
        let mapping = FEMMapping(entityName: Store.entityName())
        let dict: [String: String] = CDHelper.mapping(cls: Store.self) as! [String : String]
        mapping.addAttributes(from: dict)
        mapping.primaryKey = "entityid"
        return mapping
    }
    
    class func getAll() -> [Store]? {
        return Store.mr_findAll() as? [Store]
    }
    
    class func getByCityId(c_id : Int) -> [Store]? {
        let pre = NSPredicate(format: "city_id == %d",c_id)
        return Store.mr_findAllSorted(by: "entityid", ascending: true, with: pre) as? [Store]
    }
    
    class func getByCityIdStore(c_id : Int) -> Store? {
        let pre = NSPredicate(format: "city_id == %d",c_id)
        return Store.mr_findFirst(with: pre)
    }
    
    class func getAllBySectionsCityIds() -> [Int]? {
        let arr = Store.getAll()
        var sectionsId : [Int] = [Int]()
        for sec in arr! {
            if !sectionsId.contains(sec.city_id as! Int){
                sectionsId.append((sec.city_id?.intValue) ?? 0)
            }
        }
        return sectionsId
        // Collecting data according to the sections and show.
    }
    
    class func newEntity() -> Store? {
        let new = Store.mr_createEntity(in: NSManagedObjectContext.mr_default())
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
