// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ShippingMethods.swift instead.

import Foundation
import CoreData

public enum ShippingMethodsAttributes: String {
    case after_free_shipping_amount = "after_free_shipping_amount"
    case before_free_shipping_amount = "before_free_shipping_amount"
    case city_name = "city_name"
    case entityid = "entityid"
    case min_amt_for_free_shipping = "min_amt_for_free_shipping"
    case weight = "weight"
}

open class _ShippingMethods: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "ShippingMethods"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _ShippingMethods.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var after_free_shipping_amount: NSNumber?

    @NSManaged open
    var before_free_shipping_amount: NSNumber?

    @NSManaged open
    var city_name: String?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var min_amt_for_free_shipping: NSNumber?

    @NSManaged open
    var weight: String?

    // MARK: - Relationships

}

