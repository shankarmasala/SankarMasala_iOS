// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.swift instead.

import Foundation
import CoreData

public enum StoreAttributes: String {
    case city_id = "city_id"
    case city_name = "city_name"
    case contact_number = "contact_number"
    case contact_person = "contact_person"
    case createdDate = "createdDate"
    case email = "email"
    case entityid = "entityid"
    case state_id = "state_id"
    case status = "status"
    case store_address = "store_address"
    case store_name = "store_name"
}

open class _Store: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Store"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Store.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var city_id: NSNumber?

    @NSManaged open
    var city_name: String?

    @NSManaged open
    var contact_number: String?

    @NSManaged open
    var contact_person: String?

    @NSManaged open
    var createdDate: String?

    @NSManaged open
    var email: String?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var state_id: NSNumber?

    @NSManaged open
    var status: String?

    @NSManaged open
    var store_address: String?

    @NSManaged open
    var store_name: String?

    // MARK: - Relationships

}

