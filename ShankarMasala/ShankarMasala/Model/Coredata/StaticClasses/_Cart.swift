// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Cart.swift instead.

import Foundation
import CoreData

public enum CartAttributes: String {
    case create_date = "create_date"
    case qty = "qty"
}

public enum CartRelationships: String {
    case product = "product"
    case productAttribute = "productAttribute"
}

open class _Cart: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Cart"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Cart.entity(managedObjectContext: managedObjectContext) else { return nil }
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

    @NSManaged open
    var productAttribute: ProductAttribute?

}

