// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.swift instead.

import Foundation
import CoreData

public enum OrderAttributes: String {
    case createdDate = "createdDate"
    case img = "img"
    case itemId = "itemId"
    case offer_price = "offer_price"
    case productGujratiName = "productGujratiName"
    case productName = "productName"
    case product_attribute_id = "product_attribute_id"
    case product_id = "product_id"
    case size = "size"
    case total_price = "total_price"
    case unit = "unit"
    case updatedDate = "updatedDate"
}

open class _Order: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Order"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Order.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var createdDate: Date?

    @NSManaged open
    var img: String?

    @NSManaged open
    var itemId: NSNumber?

    @NSManaged open
    var offer_price: NSNumber?

    @NSManaged open
    var productGujratiName: String?

    @NSManaged open
    var productName: String?

    @NSManaged open
    var product_attribute_id: NSNumber?

    @NSManaged open
    var product_id: NSNumber?

    @NSManaged open
    var size: String?

    @NSManaged open
    var total_price: NSNumber?

    @NSManaged open
    var unit: String?

    @NSManaged open
    var updatedDate: Date?

    // MARK: - Relationships

}

