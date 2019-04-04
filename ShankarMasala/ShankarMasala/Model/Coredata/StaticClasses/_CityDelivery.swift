// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CityDelivery.swift instead.

import Foundation
import CoreData

public enum CityDeliveryAttributes: String {
    case entityid = "entityid"
    case is_default = "is_default"
    case name = "name"
    case state_id = "state_id"
}

open class _CityDelivery: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CityDelivery"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CityDelivery.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var is_default: NSNumber?

    @NSManaged open
    var name: String?

    @NSManaged open
    var state_id: NSNumber?

    // MARK: - Relationships

}

