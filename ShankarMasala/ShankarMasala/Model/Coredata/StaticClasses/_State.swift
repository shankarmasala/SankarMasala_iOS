// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to State.swift instead.

import Foundation
import CoreData

public enum StateAttributes: String {
    case state_id = "state_id"
    case state_name = "state_name"
}

open class _State: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "State"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _State.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var state_id: String?

    @NSManaged open
    var state_name: String?

    // MARK: - Relationships

}

