// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.swift instead.

import Foundation
import CoreData

public enum ProductAttributes: String {
    case category_id = "category_id"
    case createdDate = "createdDate"
    case entityid = "entityid"
    case image1 = "image1"
    case image2 = "image2"
    case image_count = "image_count"
    case is_new = "is_new"
    case is_offer = "is_offer"
    case product_code = "product_code"
    case product_description = "product_description"
    case product_gujarati_description = "product_gujarati_description"
    case product_gujarati_name = "product_gujarati_name"
    case product_name = "product_name"
    case status = "status"
}

public enum ProductRelationships: String {
    case product_attribute = "product_attribute"
}

open class _Product: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Product"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Product.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var category_id: String?

    @NSManaged open
    var createdDate: String?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var image1: String?

    @NSManaged open
    var image2: String?

    @NSManaged open
    var image_count: NSNumber?

    @NSManaged open
    var is_new: NSNumber?

    @NSManaged open
    var is_offer: NSNumber?

    @NSManaged open
    var product_code: String?

    @NSManaged open
    var product_description: String?

    @NSManaged open
    var product_gujarati_description: String?

    @NSManaged open
    var product_gujarati_name: String?

    @NSManaged open
    var product_name: String?

    @NSManaged open
    var status: NSNumber?

    // MARK: - Relationships

    @NSManaged open
    var product_attribute: NSSet

    open func product_attributeSet() -> NSMutableSet {
        return self.product_attribute.mutableCopy() as! NSMutableSet
    }

}

extension _Product {

    open func addProduct_attribute(_ objects: NSSet) {
        let mutable = self.product_attribute.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.product_attribute = mutable.copy() as! NSSet
    }

    open func removeProduct_attribute(_ objects: NSSet) {
        let mutable = self.product_attribute.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.product_attribute = mutable.copy() as! NSSet
    }

    open func addProduct_attributeObject(_ value: ProductAttribute) {
        let mutable = self.product_attribute.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.product_attribute = mutable.copy() as! NSSet
    }

    open func removeProduct_attributeObject(_ value: ProductAttribute) {
        let mutable = self.product_attribute.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.product_attribute = mutable.copy() as! NSSet
    }

}

