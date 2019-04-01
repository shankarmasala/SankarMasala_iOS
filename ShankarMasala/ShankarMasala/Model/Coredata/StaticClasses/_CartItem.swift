// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CartItem.swift instead.

import Foundation
import CoreData

public enum CartItemAttributes: String {
    case create_date = "create_date"
    case qty = "qty"
}

public enum CartItemRelationships: String {
    case product = "product"
}

open class _CartItem: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CartItem"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CartItem.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var create_date: Date?

    @NSManaged open
    var qty: NSNumber?

    // MARK: - Relationships

    @NSManaged open
    var product: Product?

}

