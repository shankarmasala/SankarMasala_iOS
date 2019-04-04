// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StateDelivery.swift instead.

import Foundation
import CoreData

public enum StateDeliveryAttributes: String {
    case country_id = "country_id"
    case entityid = "entityid"
    case is_default = "is_default"
    case name = "name"
}

open class _StateDelivery: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "StateDelivery"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _StateDelivery.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var country_id: NSNumber?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var is_default: NSNumber?

    @NSManaged open
    var name: String?

    // MARK: - Relationships

}

