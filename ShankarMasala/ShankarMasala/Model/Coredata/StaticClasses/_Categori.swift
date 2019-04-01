// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Categori.swift instead.

import Foundation
import CoreData

public enum CategoriAttributes: String {
    case category_gujarati_name = "category_gujarati_name"
    case category_name = "category_name"
    case count = "count"
    case createdDate = "createdDate"
    case display_order = "display_order"
    case entityid = "entityid"
    case hasChild = "hasChild"
    case image = "image"
    case image_type = "image_type"
    case isNew = "isNew"
    case is_parent = "is_parent"
    case parentCatName = "parentCatName"
    case parentCategoryId = "parentCategoryId"
    case status = "status"
}

open class _Categori: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Categori"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Categori.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var category_gujarati_name: String?

    @NSManaged open
    var category_name: String?

    @NSManaged open
    var count: NSNumber?

    @NSManaged open
    var createdDate: String?

    @NSManaged open
    var display_order: NSNumber?

    @NSManaged open
    var entityid: NSNumber?

    @NSManaged open
    var hasChild: NSNumber?

    @NSManaged open
    var image: String?

    @NSManaged open
    var image_type: NSNumber?

    @NSManaged open
    var isNew: NSNumber?

    @NSManaged open
    var is_parent: NSNumber?

    @NSManaged open
    var parentCatName: String?

    @NSManaged open
    var parentCategoryId: NSNumber?

    @NSManaged open
    var status: NSNumber?

    // MARK: - Relationships

}

