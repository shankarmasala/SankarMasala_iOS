// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProductAttribute.swift instead.

import Foundation
import CoreData

public enum ProductAttributeAttributes: String {
    case createdDate = "createdDate"
    case entityid = "entityid"
    case mrp = "mrp"
    case product_id = "product_id"
    case selling_price = "selling_price"
    case size = "size"
    case unit = "unit"
    case weight = "weight"
}

open class _ProductAttribute: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "ProductAttribute"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _ProductAttribute.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var createdDate: String?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var mrp: NSNumber?

    @NSManaged open
    var product_id: NSNumber?

    @NSManaged open
    var selling_price: NSNumber?

    @NSManaged open
    var size: String?

    @NSManaged open
    var unit: String?

    @NSManaged open
    var weight: String?

    // MARK: - Relationships

}

